#!/usr/bin/env python

import json
import requests
from datetime import datetime

WEATHER_ICONS = {
    "113": "☀️",
    "116": "⛅",
    "119": "☁️",
    "122": "☁️",
    "143": "☁️",
    "176": "🌧️",
    "179": "🌧️",
    "182": "🌧️",
    "185": "🌧️",
    "200": "⛈️",
    "227": "🌨️",
    "230": "🌨️",
    "248": "☁️",
    "260": "☁️",
    "263": "🌧️",
    "266": "🌧️",
    "281": "🌧️",
    "284": "🌧️",
    "293": "🌧️",
    "296": "🌧️",
    "299": "🌧️",
    "302": "🌧️",
    "305": "🌧️",
    "308": "🌧️",
    "311": "🌧️",
    "314": "🌧️",
    "317": "🌧️",
    "320": "🌨️",
    "323": "🌨️",
    "326": "🌨️",
    "329": "❄️",
    "332": "❄️",
    "335": "❄️",
    "338": "❄️",
    "350": "🌧️",
    "353": "🌧️",
    "356": "🌧️",
    "359": "🌧️",
    "362": "🌧️",
    "365": "🌧️",
    "368": "🌧️",
    "371": "❄️",
    "374": "🌨️",
    "377": "🌨️",
    "386": "🌨️",
    "389": "🌨️",
    "392": "🌧️",
    "395": "❄️",
}


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temperature(temperature):
    return (temperature + "°").ljust(4)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind",
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event] + " " + hour[event] + "%")

    return ", ".join(conditions)


waybar_weather = {}

try:
    weather_data = requests.get("https://wttr.in/?format=j1").json()
    current_weather = weather_data["current_condition"][0]
    location = weather_data["nearest_area"][0]
    weather_by_date = weather_data["weather"]

    feel_temp = current_weather["FeelsLikeC"]
    weather_code = current_weather["weatherCode"]
    waybar_weather["text"] = WEATHER_ICONS[weather_code] + " " + feel_temp + "°C"

    area = location["areaName"][0]["value"]
    waybar_weather["tooltip"] = f"<b>{area}</b>\n"

    weather_desc = current_weather["weatherDesc"][0]["value"]
    current_temp = current_weather["temp_C"]
    waybar_weather["tooltip"] += f"{weather_desc} {current_temp}°C\n"

    waybar_weather["tooltip"] += f"Feels like: {feel_temp}°C\n"

    wind_speed = current_weather["windspeedKmph"]
    waybar_weather["tooltip"] += f"Wind: {wind_speed}Km/h\n"

    humidity = current_weather["humidity"]
    waybar_weather["tooltip"] += f"Humidity: {humidity}%\n"

    for day, weather in enumerate(weather_by_date):
        waybar_weather["tooltip"] += f"\n<b>"
        if day == 0:
            waybar_weather["tooltip"] += "Today, "
        if day == 1:
            waybar_weather["tooltip"] += "Tomorrow, "

        waybar_weather["tooltip"] += f"{weather['date']}</b>\n"

        waybar_weather["tooltip"] += f" {weather['maxtempC']}° "
        waybar_weather["tooltip"] += f" {weather['mintempC']}° "

        astronomy = weather["astronomy"][0]
        waybar_weather["tooltip"] += f" {astronomy['sunrise']} "
        waybar_weather["tooltip"] += f" {astronomy['sunset']}\n"

        for hour in weather["hourly"]:
            time = format_time(hour["time"])
            if day == 0 and int(time) < datetime.now().hour - 2:
                continue

            icon = WEATHER_ICONS[hour["weatherCode"]]
            temp = format_temperature(hour["FeelsLikeC"])
            description = hour["weatherDesc"][0]["value"].strip()
            chances = format_chances(hour)

            waybar_weather[
                "tooltip"
            ] += f"{time} {icon} {temp} {description}, {chances}\n"

    print(json.dumps(waybar_weather))
except requests.exceptions.RequestException as e:
    print({"text": "L"})
