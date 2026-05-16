/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import { usbManager } from '@kit.MDMKit';
import restrictions from '@ohos.enterprise.restrictions';

const DISALLOWED_USB_DEVICES_MAX_SIZE = 200;
const LABEL_USB = 'usb';

export default function usbManagerTest() {
  describe('usbManager_test', () => {

  })
}