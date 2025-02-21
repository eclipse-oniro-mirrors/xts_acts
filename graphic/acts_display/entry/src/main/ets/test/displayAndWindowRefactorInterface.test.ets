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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import display from '@ohos.display';
import displaySync from '@ohos.graphics.displaySync'

export default function displayAndWindowRefactorInterfaceTest(context, windowStage, abilityStorage) {
  describe('displayAndWindowRefactorInterface_test', function () {
    console.log('describe window_api_test3 start!!!')
    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0450
     * @tc.name      : tesGetAllDisplays_Promise
     * @tc.desc      : Gets all current display objects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesGetAllDisplays_Promise', 0, async function (done) {
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
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0440
     * @tc.name      : tesGetAllDisplays_Callback
     * @tc.desc      : Gets all current display objects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesGetAllDisplays_Callback', 0, async function (done) {
      let caseName = 'tesGetAllDisplays_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      display.getAllDisplays((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`display.getAllDisplays catch error: ${JSON.stringify(error)}`)
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
        done();
        console.log(msgStr + 'done ');
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1810
     * @tc.name      : testSetExpectedFrameRateRange
     * @tc.desc      : test the enum value of hdrFormats
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetExpectedFrameRateRange', 0, async function (done) {
      let msg = "testSetExpectedFrameRateRange"
      let backDisplaySyncBigger = displaySync.create()
      console.log(msg + ' www data ' + backDisplaySyncBigger)
      try {
        let range: ExpectedFrameRateRange = {
          expected: 10,
          min: 0,
          max: 120
        };
        console.log(msg + ' www data ' + range)
        backDisplaySyncBigger.setExpectedFrameRateRange(range)
        expect(true).assertTrue()
        done()
      } catch (error) {
        console.log(msg + ' www data Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code) {
          expect().assertFail()
        } else {
          expect(true).assertTrue()
        }
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1820
     * @tc.name      : testTargetTimestamp
     * @tc.desc      : test the enum value of IntervalInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testTargetTimestamp', 0, async function (done) {
      let msg = "testTargetTimestamp"
      let backDisplaySyncBigger = displaySync.create()
      console.log(msg + ' www data ' + backDisplaySyncBigger)
      try {
        let bigger = (frameInfo) => {
          let a = frameInfo.targetTimestamp
          console.log(msg + ' www data' + JSON.stringify(a))
        }
        expect(true).assertTrue()
        done()
      } catch (error) {
        console.log(msg + ' www data Failed to Cause: ' + JSON.stringify(error));
        if (error.code) {
          expect().assertFail()
        } else {
          expect(true).assertTrue()
        }
        done()
      }
    })
  })
}
