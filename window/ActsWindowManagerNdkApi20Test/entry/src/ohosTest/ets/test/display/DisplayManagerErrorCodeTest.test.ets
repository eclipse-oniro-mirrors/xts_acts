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

import { afterEach,beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import Utils from '../common/Utils';
import windowndkapi20 from 'libwindowndkapi20.so';
import { display } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default function DisplayManagerErrorCodeTest() {
  describe('DisplayManagerErrorCodeTest', () => {
    /**
     * @tc.name   testNativeDisplayManagerErrorCode0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0300
     * @tc.desc   Test the NativeDisplayManager_ErrorCode401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplayManagerErrorCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0300';
      try{
        let result = windowndkapi20.DisplayManagerErrorCode401();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(401);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        if(err.code == 801){
          done()
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   testNativeDisplayManagerErrorCode0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0400
     * @tc.desc   Test the NativeDisplayManager_ErrorCode801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplayManagerErrorCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0400';
    try{
      let option : display.VirtualScreenConfig = {
        name: 'screen01',
        width: 0,
        height: 0,
        density: 2,
        surfaceId: ''
      };
      let data: number = await display.createVirtualScreen(option);
      let result = windowndkapi20.DisplayManagerErrorCode801(data);
      console.log(`${caseName} result: ${JSON.stringify(result)}`);
      expect([0, 801]).assertContain(result);
      done();
      console.info(caseName + 'Succeeded in creating the virtual screen. Data: ' + JSON.stringify(data));
    } catch (err) {
      console.log(caseName + ': fail:'+ err + ' '+err.code);
      if(err.code == 801){
        expect(true).assertTrue();
        done()
      }else{
        expect(false).assertTrue();
        done();
      }
    }
  })
    /**
     * @tc.name   testNativeDisplayManagerErrorCode0800
     * @tc.number SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0800
     * @tc.desc   Test the NativeDisplayManager_ErrorCode1400004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeDisplayManagerErrorCode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'SUB_ARKUI_ACE_ENGINE_DISPLAY_MANAGER_ERROR_0800';
      try{
        let result = windowndkapi20.DisplayManagerErrorCode1400004();
        console.log(`${caseName} result: ${JSON.stringify(result)}`);
        expect(result).assertEqual(1400004);
        done();
      } catch (err) {
        console.log(caseName + ': fail:'+ err + ' '+err.code);
        if(err.code == 801){
          done()
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    })

  })
}