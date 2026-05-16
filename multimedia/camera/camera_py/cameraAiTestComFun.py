#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2024 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import requests
import base64
from PIL import Image
import pillow_heif
import logging
import datetime
import os
import subprocess
import cv2
import re
import sqlite3
pillow_heif.register_heif_opener()
deviceSn = ''
import av

def heif_to_jpg_pillow(heif_path, jpg_path):
    with Image.open(heif_path) as im:
        im.convert("RGB").save(jpg_path, "JPEG")

 # === 配置 ===
API_KEY = "sk-59c64c9efdeb4403b0287741bfd98bc4"  # 替换为你自己的 DashScope API Key
BASE_URL = "https://dashscope.aliyuncs.com/compatible-mode/v1"
MODEL_NAME = "qwen-vl-max"  # 或 qwen-vl-max，根据你使用的模型调整

# === 工具函数：将图片转为 base64 ===
def image_to_base64(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode('utf-8')

# === 绿图画图检测主逻辑 ===
def chat_with_llm(image_path):
    # 检查文件是否存在
    if not os.path.exists(image_path):
        raise FileNotFoundError(f"Image file not found: {image_path}")

    # 转 base64
    img_b64 = image_to_base64(image_path)

    # 构造多模态消息
    messages = [
        {
            "role": "user",
            "content": [
                {"type": "text", "text":"""检测这个图片是否是绿图、花图只需要回答这是x图,这不是x图就行,不需要其他的回复,绿图、花图的检测规则有两套，两套规则都满足的情况下才能证明这个图片是绿图或者花图，两套规则如下：
                            规则1：{
                                1. 绿图
                                成像特征(以下三个特征都要满足才是绿图)：
                                - 图像整体呈现明显的绿色色调
                                - 绿色通道数值异常偏高，红色和蓝色通道数值偏低
                                - 可能存在颜色通道不平衡或绿色通道信号异常
                                2. 花图
                                成像特征(以下三个特征都要满足才是花图)：
                                - 图像出现色彩失真、条纹、色块或马赛克等异常纹理
                                - 可能存在水平或垂直条纹、色彩断裂、伪彩等现象
                                }
                            规则2：{
                                1. 绿图特征(以下四个特征都要满足才是绿图)：
                                - 整体亮度在 40-125 之间
                                - G通道均值显著高于R和B（G大于80，R小于50，B小于50）
                                - G通道与R/B通道差异大于50
                                - 饱和度较高（饱和度大于150）

                                判断流程：
                                步骤1：判断颜色偏向
                                - 若 G通道 > R通道+50 且 G通道 > B通道+50 → 倾向于绿图
                                - 若 RGB通道最大值与最小值差异 > 60 → 倾向于花图
                                - 否则倾向于正常图片
                                步骤2：结合对比度和饱和度验证
                                - 高对比度(> 64) + 高饱和度(> 100) → 确认为花图
                                - 高饱和度(> 150) + G通道主导 → 确认为绿图
                                }

                            另外的要求：如果检测出这个图片是绿图或者花图，那需要再重新检测2次，如果三次结果中有两次都是绿图或者花图，那这个图片就是绿图或者花图，否则不是"""},
                {"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{img_b64}"}}
            ]
        }
    ]

    # 初始化客户端
    client = OpenAI(
        api_key=API_KEY,
        base_url=BASE_URL
    )

    try:
        # 调用模型
        response = client.chat.completions.create(
            model=MODEL_NAME,
            messages=messages,
            max_tokens=30000
        )

        result = response.choices[0].message.content.strip()
        return result
    except Exception as e:
        return f"Error: {e}"

def Init(self):
    global deviceSn
    deviceSn = self.device1.device_sn

def get_logger():
    """
    #====================================================================================
    #   @Func           :  获取日志对象
    #   @return path    :  日志对象
    #===================================================================================
    """
    # 创建日志记录器
    logger_obj = logging.getLogger('camera')
    logger_obj.setLevel(logging.INFO)  # 设置日志记录器的级别

    # 创建文件处理器
    file_handler = logging.FileHandler(
        '{time}.log'.format(time=datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')), encoding='utf-8')
    file_handler.setLevel(logging.INFO)  # 设置文件处理器的级别

    # # 创建控制台处理器
    # stream_handler = logging.StreamHandler()
    # stream_handler.setLevel(logging.INFO)  # 设置控制的日志的级别

    # 创建日志格式器
    formatter = logging.Formatter('%(asctime)s [%(levelname)s] %(message)s')
    file_handler.setFormatter(formatter)
    # stream_handler.setFormatter(formatter)

    # 将处理器添加到记录器
    logger_obj.addHandler(file_handler)
    # logger_obj.addHandler(stream_handler)
    return logger_obj


logger = get_logger()

def getMediaLibrary():
    global deviceSn
    cmd = f'hdc -t {deviceSn} file recv /data/app/el2/100/database/com.ohos.medialibrary.medialibrarydata/rdb/media_library.db'
    logger.info(deviceSn)
    subprocess.run(['powershell', '-Command', cmd], capture_output=True, text=True, encoding='utf-8')

def getMediaFileFromMediaLibrary():
    global deviceSn
    getMediaLibrary()

    if os.path.exists('./media_library.db'):
        createDirectory('mediaDir')
        conn = sqlite3.connect('media_library.db')
        cursor = conn.cursor()

        cursor.execute("SELECT display_name, data FROM Photos")
        rows = cursor.fetchall()

        for row in rows:
            display_name, data = row
            if ('Video' in display_name or 'Photo' in display_name) and 'cloud/files' in data:
                file_Path = data.replace("cloud/files", "cloud/100/files", 1)
                cmd = f'hdc -t {deviceSn} file recv {file_Path} mediaDir'
                subprocess.run(['powershell', '-Command', cmd], capture_output=True, text=True, encoding='utf-8')
                tail = file_Path.rsplit('/', 1)[-1]
                src_Path = './mediaDir/' + tail
                dst_Path = './mediaDir/' + display_name
                logger.info('src_Path is ' + src_Path)
                logger.info('dst_Path is ' + dst_Path)
                os.rename(src_Path, dst_Path)
        conn.close()

pillow_heif.register_heif_opener()
def heif_to_jpg_pillow(heif_path, jpg_path):
    with Image.open(heif_path) as im:
        im.convert("RGB").save(jpg_path, "JPEG")

def find_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            yield os.path.join(root, file)

def createDirectory(path):
    """
    #====================================================================================
    #   @Func          :  新建文件夹，如果文件夹存在，则跳过
    #   @param path    :  文件的路径
    #===================================================================================
    """
    os.makedirs(path, exist_ok=True)


def check_empty_video(video_path):
    """
    检测视频文件是否是空视频
    使用PyAV库进行检测

    参数:
        video_path: 视频文件路径
    """
    if not os.path.exists(video_path):
        print(f"文件不存在: {video_path}")
        return
    try:
        container = av.open(video_path)

        video_streams = [s for s in container.streams if s.type == 'video']
        audio_streams = [s for s in container.streams if s.type == 'audio']

        has_video = len(video_streams) > 0
        has_audio = len(audio_streams) > 0

        if has_video is False:
            container.close()
            logger.info(f"{video_path} 包含视频流: {'是' if has_video else '否'}")
            return False
        if has_audio is False:
            container.close()
            logger.info(f"{video_path} 包含视频流: {'是' if has_video else '否'}")
            return False
        if has_video:
            video_stream = video_streams[0]
            fps = video_stream.average_rate

            if fps <= 1:
                container.close()
                logger.info(f"{video_path} 帧率小于等于1")
                return False

        container.close()
        return True
    except Exception as e:
        print(f"check_empty_video 检测出错: {str(e)}")
        return False


def video_to_images(video_path, output_folder, frame_interval=30):
    """
    #====================================================================================
    #   @Func               :  将视频拆解为一帧一帧的图片
    #   @video_path         :  视频路径
    #   @output_folder      :  输出文件夹
    #   @frame_interval     :  抽帧间隔,默认每隔30帧抽取一张图片
    #====================================================================================
    """
    videoDisplayName = video_path.split('\\')[-1].split('.')[0]
    print('video_path is ' + video_path)
    # 创建输出文件夹
    createDirectory(output_folder)
    isEmptyVideo = check_empty_video(video_path)
    saved_count = 0
    frame_count = 0
    if isEmptyVideo is True:
        # 打开视频文件
        cap = cv2.VideoCapture(video_path)
        # 检查是否成功打开
        if not cap.isOpened():
            logger.error("无法打开视频文件")
            return output_folder, 0

        while True:
            # 读取一帧
            ret, frame = cap.read()
            # 抽帧，每隔30帧抽一次

            # 如果读取失败（视频结束）
            if not ret:
                # 释放资源
                cap.release()
                break
            # 保存当前帧为图片
            if frame_count % 30 == 0:
                image_path = os.path.join(output_folder, f"{videoDisplayName}_frame_{frame_count:04d}.jpg")
                cv2.imwrite(image_path, frame)
                saved_count += 1
            frame_count += 1
        # 释放资源
        cap.release()

        logger.info(f"{video_path}共提取了 {saved_count} 帧图片，总帧数 {frame_count}，保存在 {output_folder} 文件夹中。")
    return frame_count

def check_image(path: str):
    """
    #====================================================================================
    #   @Func               :  检测图片是否为绿图、坏图、白图、花图、黑图
    #   @path               :  图片路径
    #   @return             :  检测结果。字典类型的数据，包括code和msg两个字段
    #====================================================================================
    """
    image_format = path.split(".")[-1]
    if image_format.lower() == "heif":
        heif_to_jpg_pillow(path, (path.rsplit('.', 1)[0]) + '.jpg')
        path = path.replace(f".{image_format}", ".jpg")
        logger.info(f"转格式为：{path}")
    check_result = {
        "code": 0,
        "msg": "图片正常"
    }
    desc = chat_with_llm(path)
    logger.info(f"图片路径：{path}")
    logger.info(f"AI检测结果：{desc}")
    if "这是" in desc or "图" not in desc:
        check_result["code"] = 1
        if "这是" in desc:
            match = re.search(r'这是(\w{2})', desc)
            check_result["msg"] = f"{match.group(1)}： {path}"
        else:
            check_result["msg"] = f"未知错误： {path}, 需要人工校验"
    return check_result