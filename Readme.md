<p align="center">
  <img src="CAD model/vtol_iso_view.png" width="200" />
</p>
<p align="center">
    <h1 align="center">VTOL FLIGHT TEST</h1>
</p>
<p align="center">
    <em><code>►For the 12 rotors aircraft model</code></em>
</p>
<p align="center">
 	<img src="https://img.shields.io/github/license/Railflight/Vtol-flight-test?style=default&color=0080ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/Railflight/Vtol-flight-test?style=default&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/Railflight/Vtol-flight-test?style=default&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/Railflight/Vtol-flight-test?style=default&color=0080ff" alt="repo-language-count">
<p>
<p align="center">
	<!-- default option, no dependency badges. -->
</p>
<hr>

##  Quick Links

> - [ Overview](#-overview)
> - [ Features](#-features)
> - [ Repository Structure](#-repository-structure)
> - [ Modules](#-modules)
> - [ Getting Started](#-getting-started)
>   - [ Installation](#-installation)
>   - [ Running Vtol-flight-test](#-running-Vtol-flight-test)
>   - [ Tests](#-tests)
> - [ Project Roadmap](#-project-roadmap)
> - [ Contributing](#-contributing)
> - [ License](#-license)
> - [ Acknowledgments](#-acknowledgments)

---

##  Overview

<code>► INSERT-TEXT-HERE</code>

---

##  Features

<code>► INSERT-TEXT-HERE</code>

---

##  Repository Structure

```sh
└── Vtol-flight-test/
    ├── 3D Map
    │   └── link.txt
    ├── Euler Angles
    │   └── euler_angles.txt
    ├── Reference
    │   └── reference.txt
    ├── Translation Matrix Function
    │   └── makehgtform.m
    ├── euler.txt
    ├── flight_path.txt
    ├── flight_test.m
    ├── flight_test_octave.m
    ├── makehgtformoctave.m
    ├── run.sh
    ├── the_3d_map.txt
    ├── total_states.txt
    ├── trajectory_reference.txt
    ├── vtolCAD.STL
    └── vtolModel.m
```

---

##  Modules

<details closed><summary>.</summary>

| File                                                                                                            | Summary                         |
| ---                                                                                                             | ---                             |
| [flight_test_octave.m](https://github.com/Railflight/Vtol-flight-test/blob/master/flight_test_octave.m)         | <code>► INSERT-TEXT-HERE</code> |
| [the_3d_map.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/the_3d_map.txt)                     | <code>► INSERT-TEXT-HERE</code> |
| [vtolModel.m](https://github.com/Railflight/Vtol-flight-test/blob/master/vtolModel.m)                           | <code>► INSERT-TEXT-HERE</code> |
| [flight_path.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/flight_path.txt)                   | <code>► INSERT-TEXT-HERE</code> |
| [euler.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/euler.txt)                               | <code>► INSERT-TEXT-HERE</code> |
| [flight_test.m](https://github.com/Railflight/Vtol-flight-test/blob/master/flight_test.m)                       | <code>► INSERT-TEXT-HERE</code> |
| [makehgtformoctave.m](https://github.com/Railflight/Vtol-flight-test/blob/master/makehgtformoctave.m)           | <code>► INSERT-TEXT-HERE</code> |
| [trajectory_reference.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/trajectory_reference.txt) | <code>► INSERT-TEXT-HERE</code> |
| [vtolCAD.STL](https://github.com/Railflight/Vtol-flight-test/blob/master/vtolCAD.STL)                           | <code>► INSERT-TEXT-HERE</code> |
| [run.sh](https://github.com/Railflight/Vtol-flight-test/blob/master/run.sh)                                     | <code>► INSERT-TEXT-HERE</code> |
| [total_states.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/total_states.txt)                 | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>Euler Angles</summary>

| File                                                                                                         | Summary                         |
| ---                                                                                                          | ---                             |
| [euler_angles.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/Euler Angles/euler_angles.txt) | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>3D Map</summary>

| File                                                                                   | Summary                         |
| ---                                                                                    | ---                             |
| [link.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/3D Map/link.txt) | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>Reference</summary>

| File                                                                                                | Summary                         |
| ---                                                                                                 | ---                             |
| [reference.txt](https://github.com/Railflight/Vtol-flight-test/blob/master/Reference/reference.txt) | <code>► INSERT-TEXT-HERE</code> |

</details>

<details closed><summary>Translation Matrix Function</summary>

| File                                                                                                                  | Summary                         |
| ---                                                                                                                   | ---                             |
| [makehgtform.m](https://github.com/Railflight/Vtol-flight-test/blob/master/Translation Matrix Function/makehgtform.m) | <code>► INSERT-TEXT-HERE</code> |

</details>

---

##  Getting Started

***Requirements***

Ensure you have one of the following software installed on your system:

* **Octave**: `version 8.4.0`
* **Matlab**: `version R2022a` 

###  Installation

1. Clone the Vtol-flight-test repository:

```sh
git clone https://github.com/Railflight/Vtol-flight-test
```

2. Change to the project directory:

```sh
cd Vtol-flight-test
```

<!-- 3. Install the dependencies:

```sh
> INSERT-INSTALL-COMMANDS
``` -->

###  Running a Test

Use the following command to run a test in Octave:

```sh
> octave flight_test_octave.m
```


Or in Matlab:

```sh
> matlab flight_test.m
```

> You can also open the software and run `flight_test.m` or `flight_test_octave.m` via the editor option
---

##  Project Roadmap

- [X] `► INSERT-TASK-1`
- [ ] `► INSERT-TASK-2`
- [ ] `► ...`

---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github/Railflight/Vtol-flight-test/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github/Railflight/Vtol-flight-test/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github/Railflight/Vtol-flight-test/issues)**: Submit bugs found or log feature requests for Vtol-flight-test.

<details closed>
    <summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone https://github.com/Railflight/Vtol-flight-test
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

##  License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#-quick-links)

---
