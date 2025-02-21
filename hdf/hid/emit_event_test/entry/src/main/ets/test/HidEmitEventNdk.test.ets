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

import { describe, expect, it } from '@ohos/hypium'
import hidEmitEvent from 'libhidemiteventndk.so'

export default function HidEmitEventTest() {
  describe('HidEmitEventTest', () => {

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0100
     * @tc.name       : testHidCreateDevice0100
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDevice();
      console.info("Test result testHidCreateDevice0100 : " + ret);
      expect(ret >= 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0200
     * @tc.name       : testHidEmitEventOne0100
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventOne0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventOne();
      console.info("Test result testHidEmitEventOne0100 : " + ret);
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0300
     * @tc.name       : testHidEmitEventTwo0200
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventTwo0200', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventTwo();
      console.info("Test result testHidEmitEventTwo0200 : " + ret);
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0400
     * @tc.name       : testHidEmitEventThree0300
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventThree0300', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventThree();
      console.info("Test result testHidEmitEventThree0300 : " + ret);
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0500
     * @tc.name       : testHidDestroyDeviceOne0100
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceOne0100', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceOne();
      console.info("Test result testHidDestroyDeviceOne0100 : " + ret);
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0600
     * @tc.name       : testHidDestroyDeviceTwo0200
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceTwo0200', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceTwo();
      console.info("Test result testHidDestroyDeviceTwo0200 : " + ret);
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0700
     * @tc.name       : testHidDestroyDeviceThree0300
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceThree0300', 0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceThree();
      console.info("Test result testHidDestroyDeviceThree0300 : " + ret);
      expect(ret != 0).assertTrue();
      done()
    });

  })
}
