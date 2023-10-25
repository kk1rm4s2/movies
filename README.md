# iOS Engineer Home Task

I primarily use my GitHub account [@kkiermasz](https://github.com/kkiermasz), but I posted this here to keep my involvement in the recruitment process confidential from my friends.

## Notes

I would like to clarify a few points:

1. **Pagination Mechanism**: There is no pagination mechanism implemented on the dashboard. I understand that this is out of the scope of this task, as it would become pretty big one.

2. **Dependency Injection (DI)**: There is no DI (resolver) framework integrated into this project. Creating one from scratch or configuring a third-party DI framework could be a substantial task. Notice that the `Domain` is exposed via a `DI` class for dependency management.

3. **Data Layer**: `Data` layer is not separated into a distinct package. Typically, the `Data` layer would import the `Domain` and `Domain` would resolve the necessary implementations. For the purpose of this task, all `Data` layer contents are kept inside the `Domain`'s `Data` directory as a workaround.
