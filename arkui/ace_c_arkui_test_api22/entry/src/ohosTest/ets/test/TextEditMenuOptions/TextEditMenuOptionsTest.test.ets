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
import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeFunc from 'libnativefunc.so'
import Utils from '../common/Utils';

export default function TextEditMenuOptionsTest() {

  describe('TextEditMenuOptionsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions01
     * @tc.name    TextEditMenuOptionsTest001
     * @tc.desc    testing TextEditMenuOptions CAPI creat & dispose
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions01()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions02
     * @tc.name    TextEditMenuOptionsTest002
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnCreateMenu success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions02()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions03
     * @tc.name    TextEditMenuOptionsTest003
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnCreateMenu failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions03()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions04
     * @tc.name    TextEditMenuOptionsTest004
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnPrepareMenu success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions04()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions05
     * @tc.name    TextEditMenuOptionsTest005
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnPrepareMenu failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions05()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions06
     * @tc.name    TextEditMenuOptionsTest006
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnMenuItemClick success
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions06()).assertEqual(0)
      done()
    })


    /**
     * @tc.number  Test_OH_ArkUI_TextEditMenuOptions07
     * @tc.name    TextEditMenuOptionsTest007
     * @tc.desc    testing TextEditMenuOptions CAPI RegisterOnMenuItemClick failed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('TextEditMenuOptionsTest007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.Test_OH_ArkUI_TextEditMenuOptions07()).assertEqual(0)
      done()
    })
  })
}
