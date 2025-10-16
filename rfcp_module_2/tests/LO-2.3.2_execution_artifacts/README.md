Run all tests from test suite directory

`cd tests/k2_demos/LO-2.3.2_execution_artifacts/`

`robot .`

Output to a specific output directory:

`robot -d results .`


1. output.xml

    Purpose: The raw execution log in XML format.

    Generated always: This is the primary log from which other reports are derived.

    Contains:

        Suite and test metadata

        All keyword calls

        Arguments, return values

        Logs and timestamps

👉 Tip to Demo:
Open it with a browser or IDE to show it's structured but not user-friendly for reading directly.

2. log.html

    Purpose: Detailed execution log in a user-friendly format.

    Content:

        Keyword-level trace of execution

        Includes arguments, return values, log messages, and exact failure points

        Timestamps for performance tracking

👉 Tip to Demo:
Open log.html, expand the test cases, and show:

    How failures are marked clearly

    Passed and even not-run keywords are listed

    Exact keyword and arguments used at failure

3. report.html

    Purpose: High-level summary of the suite execution.

    Content:

        Number of tests executed, passed, failed

        Execution time

        Link to the log.html
