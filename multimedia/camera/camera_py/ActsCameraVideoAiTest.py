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
import time
from devicetest.core.test_case import TestCase, Step
from cameraAiTestComFun import logger, find_files, check_image, video_to_images
import os

class ActsCameraVideoAiTest(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")
        logger.info("----------开始检测录像出图是否是绿图花图黑图----------")
        folder_name = "mediaDir"
        folder_dir = r"."  # 替换为你的图像文件夹路径
        folder_path = os.path.join(folder_dir, folder_name)
        checkARray = []
        videoDir = './VideoDir'
        for videoFile in find_files(folder_path):
            if videoFile.lower().endswith((".mp4")):
                image_count = video_to_images(videoFile, videoDir)
                if image_count <= 2:
                    logger.info(f"{videoFile} 当前视频帧数过少，帧数为{image_count}，视频可能为空视频")
                    assert False, f"{videoFile} 当前视频帧数过少，帧数为{image_count}，视频可能为空视频"
        for videoImageFile in find_files(videoDir):
            CheckRes = check_image(videoImageFile)
            checkARray.append(CheckRes)
            time.sleep(2)
        for checkItem in checkARray:
            assert checkItem["code"] == 0, checkItem["msg"]
        logger.info("----------结束检测录像出图是否是绿图花图黑图----------")

    def teardown(self):
        Step("Teardown")