# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
from robot.api.deco import keyword

class CustomKeywords:
    @keyword
    def schedule_reminder(self, message: str, delay_minutes: int):
        print(f"Scheduled reminder: '{message}' in {delay_minutes} minute(s).")
