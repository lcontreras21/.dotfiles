<!-- Template from https://github.com/othneildrew/Best-README-Template -->
<a name="readme-top"></a>
<!-- *** https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- PROJECT LOGO -->
<br/>
<div align="center">
  <h3 align="center">.dotfiles</h3>
  <p align="center">
    My .dotfiles! They're mine.
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing">Testing</a></li>
      </ul>
    </li>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

### Built With

[![Ansible][Ansible.com]][Ansible-url]
[![Docker][Docker.com]][Docker-url]
[![Stow][Stow.com]][Stow-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

<!-- TODO: list requirements -->
Have certain packages installed on your system

Using apt
```
sudo apt install python3-pip git-all sudo wget fzf
```
If using the `bootstrap.sh` script, pip is all that's needed to install ansible. If cloning the repo directly, install ansible using apt `sudo apt install ansible` if pip install available or with pip. Either way, your machine.

If wanting to test, have Docker installed

### Installation

##### Using Script
Run 
```
curl https://raw.githubusercontent.com/lcontreras21/.dotfiles/ansible-izing/bootstrap.sh | sh
```

##### Direct Install
1. Clone the repo
```
git clone --recurse-submodules https://github.com/lcontreras21/.dotfiles.git .dotfiles
```
2. Install dependencies
```
sudo apt install ansible  // if Using apt
pip install ansible       // if using pip
ansible-galaxy install -r bootstraps/requirements.yml
```
3. Run ansible playbook
```
ansible-playbook bootstraps/bootstrap.yml --ask-become-pass
```

### Testing
Testing involves launching a Docker container, execing into it, and making sure the dotfiles were installed correctly. There are two versions, direct and indirect. Direct copies the current directory into the container. Indirect will pull it from Github.

Running the following command will prompt you with direct/indirect versions of Pop!_OS and Ubuntu. Selecting one will create the image and then create the container in detached mode.
```
./bootstrap.sh
```

Access the container by running the following commnad. It will prompt for any containers that are up
```
./exec.sh
```
To spin down all of the containers, run
```
./kill.sh
```

If containerization fails before or at the ansible phase, you can comment that part out of the Dockerfile. Make sure to set the exec part of the docker compose of that container to use bash instead of zsh, and change the `sudo docker exec` command to use bash. Then debug as normal.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [ ] Create symlinks using Ansible instead of GNU Stow, to remove need for one more package
- [ ] Allow kill script to pick specific containers, or all

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ABOUT -->
## About The Project 

Blah Blah Blah leaving this just for me 

What else is there to say. Herein lives all of my configs for stuff such as neovim (btw), tmux etc. Stuff I couldn't live without. 

Originally, I had everything simply in folders ala `PKG/.config/PKG/contents/` so that it would be compatible with GNU Stow. This was easy and straightforward in the beginning when I was working on one machine, but soon proved to be not that helpful when moving to a new machine. Questions came up. What packages do I want/have installed? Will it work in that environment? How much can I take out of it being implicitely assumed?

That prompted the usage of Ansible. By extension, I also used Docker to test that my *.dotfiles* would be initialized correctly. I install all of my favorite packages, I run GNU Stow, I manage stuff separately for each environment, and so much more with Ansible.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Ansible.com]: https://img.shields.io/badge/Ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white
[Ansible-url]: https://docs.ansible.com/
[Docker.com]: https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://docs.docker.com/
[Stow.com]: https://img.shields.io/badge/Stow-000000?style=for-the-badge&logo=stow&logoColor=white
[Stow-url]: https://www.gnu.org/software/stow/manual/stow.html
