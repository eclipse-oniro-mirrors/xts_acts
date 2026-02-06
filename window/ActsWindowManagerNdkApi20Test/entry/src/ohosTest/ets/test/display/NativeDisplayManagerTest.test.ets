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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import Utils from '../common/Utils';
import windowndkapi20 from 'libwindowndkapi20.so';
import { BusinessError } from '@kit.BasicServicesKit';
import { display } from "@kit.ArkUI";

interface Capability {
  foldStatus: string;
  foldDisplayMode: string;
  rotation: string[];
  orientation: string[]
}

interface CapabilityData {
  capability: Capability[];
}

export default function NativeDisplayManagerTest() {
  describe('NativeDisplayManagerTest', () => {

    /**
     * @tc.name   testNativeDisplaySourceMode0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_NONE_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplaySourceMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_NONE_0100';
        try {
          let option: display.VirtualScreenConfig = {
            name: 'screen01',
            width: 1080,
            height: 2340,
            density: 2,
            surfaceId: ''
          };
          let data: number = await display.createVirtualScreen(option);
          let result = windowndkapi20.GetDisplaySourceMode001(data);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          expect([0, 801]).assertContain(result);
          done();
          console.info(caseName + 'Succeeded in creating the virtual screen. Data: ' + JSON.stringify(data));
        } catch (err) {
          console.log(caseName + ': fail:' + err + ' ' + err.code);
          if (err.code == 801) {
            expect([0, 801]).assertContain(err.code);
            done()
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   testNativeDisplaySourceMode0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_MAIN_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplaySourceMode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_MAIN_0100';
        try {
          let result = windowndkapi20.GetDisplaySourceMode002();
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.log(caseName + ': fail:' + err + ' ' + err.code);
          if (err.code == 801) {
            done()
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })
    /**
     * @tc.name   testNativeDisplaySourceMode0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_MIRROR_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplaySourceMode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_MIRROR_0100';
        try {
          let result = windowndkapi20.GetDisplaySourceMode(2);
          console.log(caseName + ' :' + result);
          expect(0).assertEqual(result);
          done();
        } catch (err) {
          console.log(caseName + ': fail:' + err + ' ' + err.code);
          if (err.code == 801) {
            done()
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })
    /**
     * @tc.name   testNativeDisplaySourceMode0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_EXTEND_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplaySourceMode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_EXTEND_0100';
        try {
          let result = windowndkapi20.GetDisplaySourceMode(3);
          console.log(caseName + ' :' + result);
          expect(0).assertEqual(result);
          done();
        } catch (err) {
          console.log(caseName + ': fail:' + err + ' ' + err.code);
          if (err.code == 801) {
            done()
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })
    /**
     * @tc.name   testNativeDisplaySourceMode0500
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_ALONE_0100
     * @tc.desc   Test the NativeDisplayManager_SourceMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplaySourceMode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_SOURCE_MODE_ALONE_0100';
        try {
          let option: display.VirtualScreenConfig = {
            name: 'screen01',
            width: 1080,
            height: 2340,
            density: 2,
            surfaceId: ''
          };
          let data: number = await display.createVirtualScreen(option);
          await display.makeUnique(data);
          let result = windowndkapi20.GetDisplaySourceMode003(data);
          console.log(`${caseName} result: ${JSON.stringify(result)}`);
          expect(result).assertEqual(4);
          done();
        } catch (err) {
          console.log(caseName + ': fail:' + err + ' ' + err.code);
          if (err.code === 801) {
            expect([0, 801]).assertContain(err.code);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })
    /**
     * @tc.name   testFoldDisplayMode0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_UNKNOWN_0100
     * @tc.desc   Test the NativeDisplayManager_FoldDisplayMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldDisplayMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_UNKNOWN_0100';
      try {
        let result = windowndkapi20.GetFoldDisplayMode(0);
        console.log(caseName + ' :' + result);
        expect([0, 801]).assertContain(result);
        done();
      } catch (err) {
        console.log(caseName + ': fail:' + err + ' ' + err.code);
        if (err.code == 801) {
          expect([0, 801]).assertContain(err.code);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testFoldDisplayMode0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_FULL_0100
     * @tc.desc   Test the NativeDisplayManager_FoldDisplayMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldDisplayMode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_FULL_0100';
      try {
        let result = windowndkapi20.GetFoldDisplayMode(1);
        console.log(caseName + ' :' + result);
        expect([0, 801]).assertContain(result);
        done();
      } catch (err) {
        console.log(caseName + ': fail:' + err + ' ' + err.code);
        if (err.code == 801) {
          expect([0, 801]).assertContain(err.code);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testFoldDisplayMode0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_MAIN_0100
     * @tc.desc   Test the NativeDisplayManager_FoldDisplayMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldDisplayMode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_MAIN_0100';
      try {
        let result = windowndkapi20.GetFoldDisplayMode(2);
        console.log(caseName + ' :' + result);
        expect([0, 801]).assertContain(result);
        done();
      } catch (err) {
        console.log(caseName + ': fail:' + err + ' ' + err.code);
        if (err.code == 801) {
          expect([0, 801]).assertContain(err.code);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testFoldDisplayMode0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_SUB_0100
     * @tc.desc   Test the NativeDisplayManager_FoldDisplayMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldDisplayMode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_SUB_0100';
      try {
        let result = windowndkapi20.GetFoldDisplayMode(3);
        console.log(caseName + ' :' + result);
        expect([0, 801]).assertContain(result);
        done();
      } catch (err) {
        console.log(caseName + ': fail:' + err + ' ' + err.code);
        if (err.code == 801) {
          expect([0, 801]).assertContain(err.code);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testFoldDisplayMode0500
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_COORDINATION_0100
     * @tc.desc   Test the NativeDisplayManager_FoldDisplayMode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldDisplayMode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_FOLD_DISPLAY_MODE_COORDINATION_0100';
      try {
        let result = windowndkapi20.GetFoldDisplayMode(4);
        console.log(caseName + ' :' + result);
        expect([0, 801]).assertContain(result);
        done();
      } catch (err) {
        console.log(caseName + ': fail:' + err + ' ' + err.code);
        if (err.code == 801) {
          expect([0, 801]).assertContain(err.code);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}