# API List

## Plan

### Current Plan
- GET /plans/current
- Request
    - String userName
- Response
    - PlanType type
        - A, B, C, D, E

### Plan List
- GET /plans
- Request
- Response
    - List
        - Long id
        - PlanType type
        - String name
        - boolean isCurrent