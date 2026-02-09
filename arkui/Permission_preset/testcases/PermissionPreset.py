#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
"""

from devicetest.base.test_sub_case import TestCase
from hypium import UiDriver, BY
from hypium.model import UiParam
from xdevice import platform_logger

log = platform_logger("Preload")

class PermissionPreset(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        self.tests = ["test_step"]
        TestCase.__init__(self, self.TAG, controllers)
        self.driver = UiDriver(self.device1)

    def setup(self):
        self.driver.wake_up_display()
        self.driver.swipe_to_home()
        self.driver.go_home()

    def test_step(self):
        driver = self.driver
        driver.wait(2)
        # 2、左滑进入负一屏
        driver.swipe(UiParam.RIGHT, distance=60, start_point=(0.8, 0.5))
        driver.wait(1)
        # 3、检测小艺弹窗
        # 开启负一屏
        open_fuyiping = driver.wait_for_component(BY.text("开启负一屏"))
        if open_fuyiping is not None:
            driver.touch(open_fuyiping)
        driver.wait(1)
        # 同意    Paf.Permission.button_confirm
        accept_button = driver.wait_for_component(BY.text("同意"))
        if accept_button is not None:
            driver.touch(accept_button)
            driver.wait(1)
        # 服务, 搜索         服务686, 247
        search = driver.wait_for_component(BY.text("服务, 搜索"))
        if search is not None:
            search_button = search
        else:
            search_button = driver.wait_for_component(BY.text("服务"))
        driver.touch(search_button)
        driver.wait(1)
        # 同意    Paf.Permission.button_confirm
        accept_button = driver.wait_for_component(BY.text("同意"))
        if accept_button is not None:
            driver.touch(accept_button)
            driver.wait(1)
        # 下一步
        next_button = driver.wait_for_component(BY.text("下一步"))
        if next_button is not None:
            driver.touch(next_button)
            driver.wait(1)

        # 完成
        completed_button = driver.wait_for_component(BY.text("完成"))
        if completed_button is not None:
            driver.touch(completed_button)
            driver.wait(1)

        # 点击搜索框
        search_field = driver.wait_for_component(BY.type("SearchField"))
        if search_field is not None:
            driver.touch(search_field)
            driver.wait(1)

    def teardown(self):
        self.driver.go_home()
        self.driver.shell("kill -9 $(pidof uitest)")