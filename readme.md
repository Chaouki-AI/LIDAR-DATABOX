# LIDARDataBox : Depth Estimation Dataset Downloader 

This repository contains scripts for downloading depth estimation datasets, including **KITTI**, **DIODE**, **SUNRGBD**, and soon to include others like **NYUv2**. The tool is designed to efficiently download RGB images and their corresponding depth maps, which are essential for depth estimation research and projects.

## Project Overview

This script was developed by [**Mohammed Chaouki ZIARA**](mailto:medchaoukiziara@gmail.com) as part of his Ph.D. research at the [**RCAM Laboratory**](https://www.univ-sba.dz/rcam/index.php), 
Djilali Liabes University - Algeria. 

The tool is specifically designed for use in depth estimation tasks, accelerating dataset acquisition for training and testing models in this field.

### Datasets Currently Supported:
- **KITTI**: [KITTI Dataset](http://www.cvlibs.net/datasets/kitti/)
 (Autonomous driving dataset)
- **DIODE**: [DIODE Dataset](https://diode-dataset.org/) (Indoor and outdoor depth dataset)
- **SUNRGBD**: [SUNRGBD Dataset](http://rgbd.cs.princeton.edu/) (Scene understanding dataset)

### Future Additions: 
- **NYUv2** : [Download here](https://drive.usercontent.google.com/download?id=1wC-io-14RCIL4XTUrQLk6lBqU2AexLVp&export=download&authuser=0) ,
visit the official [dataset](https://cs.nyu.edu/~fergus/datasets/nyu_depth_v2.html)
- **Make3D**: Coming soon

## Requirements

Before running the script, ensure the following dependencies are installed:

- **GNU Parallel**: Recommended for faster dataset processing, particularly for the KITTI dataset cleanup. Install by following the instructions
 [Here](https://medium.com/analytics-vidhya/simple-tutorial-to-install-use-gnu-parallel-79251120d618)
- **Unzip** : Required to extract dataset files 
  ```bash
  sudo apt-get install unzip

## Usage 
1. Clone this repository:
  ```bash
  git clone https://github.com/chaouki-ai/LIDAR-DATABOX
  cd LIDAR-DATABOX
  chmod +x ./LIDARDataBox.sh
  ```
2. Start downloading the datasets: in order to download Kitti, Diode and SunRGBD datasets :
  ```bash
  ./LIDARDataBox.sh 
  ```

3. Optional :  if you would like to download only one or multiple dataset you can use the following arguments : 
**diode** , **kitti** or **SunRGBD**. <br /><br />
for example to download, kitti and diode datasets :
  ```bash
  ./LIDARDataBox.sh kitti diode
  ```


## Keywords
&emsp;Depth Estimation<br />
&emsp;KITTI Dataset<br />
&emsp;SUNRGBD Dataset<br />
&emsp;DIODE Dataset<br />
&emsp;NYUv2 Dataset<br />
&emsp;RGB Images<br />
&emsp;Depth Maps<br />
&emsp;LIDAR Data<br />
