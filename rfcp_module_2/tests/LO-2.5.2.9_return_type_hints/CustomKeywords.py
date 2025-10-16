# © 2025 Testsmith. Exclusive training material.
# Distributed to armin a (armin.arabshahi@gmail.com) on 2025-09-22.
# Licensed for personal learning only. No redistribution, copying, or public posting
# (including blogs, social media, GitHub, Gists, or forums). Do not remove this notice.
# Contact: info@testsmith.io
from robot.api.deco import keyword

class CustomKeywords:

    @keyword
    def get_number_with_hint(self) -> int:
        """Returns a number with return type hint."""
        return 42

    @keyword
    def get_text_without_hint(self):
        """Returns a string, but without a return type hint."""
        return "Hello, Robot Framework!"

    @keyword
    def get_multiple_values(self) -> tuple[str, int]:
        """Returns a tuple with string and integer."""
        return ("Value", 99)
