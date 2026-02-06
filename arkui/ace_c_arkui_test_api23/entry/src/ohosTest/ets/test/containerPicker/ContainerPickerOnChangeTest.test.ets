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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

const SLEEP_TIME_1000 = 1000;
export default function ContainerPickerOnChangeTest() {

  describe('ContainerPickerOnChangeTest', () => {

    let PAGE_TAG = 'ContainerPickerOnChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`containerPicker/${PAGE_TAG}`, done);
    });

    /**
     * @tc.number      SUB_ARKUI_PICKER_EVENT_ON_CHANGE_0100
     * @tc.name        testContainerPickerOnChange001
     * @tc.desc        test OnChange event callback
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('testContainerPickerOnChange001', Level.LEVEL1, async (done: Function) => {
      await Utils.pickerFlingComponent('containerPickerOnChangeTest', false, true);
      await Utils.sleep(SLEEP_TIME_1000)
      expect(Utils.getComponentInfoByKey('containerPickerOnChangeTest').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })


  })
}
