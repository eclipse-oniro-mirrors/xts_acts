'use static';
/*
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
 */


import accessibilitySelectedTypeTest from './chip/accessibilitySelectedTypeTest.test';
import onScrollStopTest from './textPicker/onScrollStopTest.test';
import maxFontScaleTest from './segmentButton/maxFontScaleTest.test'
export default function testsuite() {
  onScrollStopTest()  //SDK11.25  Pass: 2
  maxFontScaleTest()  //11.25.SDK上 编译问题高级组件，0702不实现
  accessibilitySelectedTypeTest()   //11.25.SDK 编译问题 chip B018交付
}