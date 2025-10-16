Include tests with tag smoke:

robot --include smoke demo.robot

Exclude tests with tag slow:

robot --exclude slow demo.robot

Include regression, but exclude unstable:

robot --include regression --exclude unstable demo.robot

Include all tests starting with feature-:

robot --include 'feature-*' demo.robot

Exclude all tests ending with -deprecated:

robot --exclude '*-deprecated' demo.robot