/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , Level, TestType, Size} from "@ohos/hypium"
import display from '@ohos.display';
import displaySync from '@ohos.graphics.displaySync'
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import window from '@ohos.window';

export default function displayAndWindowRefactorInterfaceTest() {
  describe('displayAndWindowRefactorInterface_test', () => {
    console.log('describe window_api_test3 start!!!');
    let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
    let windowStage:window.WindowStage = AppStorage.get('windowStage') as window.WindowStage;
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

    /**
     * @tc.name   tesGetAllDisplays_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0450
     * @tc.desc   Gets all current display objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tesGetAllDisplays_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'tesGetAllDisplays_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      await display.getAllDisplays().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
        expect(data[0].id != null).assertTrue();
        expect(data[0].refreshRate != null).assertTrue();
        expect(data[0].width != null).assertTrue();
        expect(data[0].height != null).assertTrue();
        expect(data[0].rotation != null).assertTrue();
        expect(data[0].densityDPI != null).assertTrue();
        expect(data[0].name != null).assertTrue();
        expect(data[0].alive).assertTrue();
        expect(data[0].state != null).assertTrue();
        expect(data[0].densityPixels != null).assertTrue();
        expect(data[0].scaledDensity != null).assertTrue();
        expect(data[0].xDPI != null).assertTrue();
        expect(data[0].yDPI != null).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });
    /**
     * @tc.name   tesGetAllDisplays_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0440
     * @tc.desc   Gets all current display objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('tesGetAllDisplays_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = 'tesGetAllDisplays_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      display.getAllDisplays((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`display.getAllDisplays catch error: ${JSON.stringify(error)}`);
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
        expect(data[0].refreshRate != null).assertTrue();
        expect(data[0].width != null).assertTrue();
        expect(data[0].height != null).assertTrue();
        expect(data[0].rotation != null).assertTrue();
        expect(data[0].densityDPI != null).assertTrue();
        expect(data[0].name != null).assertTrue();
        expect(data[0].alive).assertTrue();
        expect(data[0].state != null).assertTrue();
        expect(data[0].densityPixels != null).assertTrue();
        expect(data[0].scaledDensity != null).assertTrue();
        expect(data[0].xDPI != null).assertTrue();
        expect(data[0].yDPI != null).assertTrue();
        expect(data[0].screenShape == 0 || data[0].screenShape == 1).assertTrue();
        done();
        console.log(msgStr + 'done ');
      });
    });
    /**
     * @tc.name   testSetExpectedFrameRateRange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1810
     * @tc.desc   test the enum value of hdrFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetExpectedFrameRateRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let msg = "testSetExpectedFrameRateRange";
      let backDisplaySyncBigger = displaySync.create();
      console.log(msg + ' www data ' + backDisplaySyncBigger);
      try {
        let range: ExpectedFrameRateRange = {
          expected: 10,
          min: 0,
          max: 120
        };
        console.log(msg + ' www data ' + range);
        backDisplaySyncBigger.setExpectedFrameRateRange(range);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msg + ' www data Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code) {
          expect().assertFail();
        } else {
          expect(true).assertTrue();
        }
        done();
      }
    });
    /**
     * @tc.name   testTargetTimestamp
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1820
     * @tc.desc   test the enum value of IntervalInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTargetTimestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let msg = "testTargetTimestamp";
      let backDisplaySyncBigger = displaySync.create();
      console.log(msg + ' www data ' + backDisplaySyncBigger);
      try {
        let bigger = (frameInfo:displaySync.IntervalInfo) => {
          let a = frameInfo.targetTimestamp;
          console.log(msg + ' www data' + JSON.stringify(a));
        };
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msg + ' www data Failed to Cause: ' + JSON.stringify(error));
        if (error.code) {
          expect().assertFail();
        } else {
          expect(true).assertTrue();
        }
        done();
      }
    });
    /**
     * @tc.name   test_CreateVirtualScreen_ErrorCode201
     * @tc.number SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0200
     * @tc.desc   test_CreateVirtualScreen_ErrorCode201 when without permissions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CreateVirtualScreen_ErrorCode201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_CreateVirtualScreen_ErrorCode201 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 1,
        height: 2340,
        density: 2,
        surfaceId: ''
      }
      try {
        display.createVirtualScreen(option).then((screenId: number) => {
          console.info(caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(caseName + 'failed to create the virtual screen, err : ' + JSON.stringify(err.code)+',msg:'+ JSON.stringify(err.message));
          expect(err.code == 201).assertTrue();
          expect(err.message!=null).assertTrue();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err)+',msg:'+ JSON.stringify(err.message));
        if (err.code != 801) {
          expect(err.message!=null).assertTrue();
          expect().assertFail();
        }
        done();
      }
    });
  })
}
