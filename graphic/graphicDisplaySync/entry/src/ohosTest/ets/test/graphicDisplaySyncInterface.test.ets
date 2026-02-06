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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import animator, { AnimatorResult } from '@ohos.animator';
import { displaySync } from '@kit.ArkGraphics2D';

export default function graphicDisplaySyncInterfaceTest() {
  describe('graphicDisplaySyncInterfaceTest', ()=> {
    console.log('describe graphicDisplaySyncInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_001
     * @tc.name      : testSetExpectedFrameRateRange
     * @tc.desc      : Test the function of SetExpectedFrameRateRange Promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testSetExpectedFrameRateRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testSetExpectedFrameRateRange===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let range: ExpectedFrameRateRange = {
          min: 0,
          max: 120,
          expected: 30
        }
        backDisplaySync?.setExpectedFrameRateRange(range)
        console.info(msg + 'Succeeded in setExpectedFrameRateRange.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to setExpectedFrameRateRange. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_002
     * @tc.name      : testOnFrame
     * @tc.desc      : Subscribe to changes per frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testOnFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testOnFrame===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let callback = (frameInfo: displaySync.IntervalInfo) => {
          console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }
        backDisplaySync?.on("frame", callback)
        console.info(msg + 'Succeeded in on.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to on. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_003
     * @tc.name      : testOffFrame
     * @tc.desc      : Unsubscribe from changes per frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testOffFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testOffFrame===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let callback = (frameInfo: displaySync.IntervalInfo) => {
          console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }
        backDisplaySync?.off("frame", callback)
        console.info(msg + 'Succeeded in off.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to off. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_004
     * @tc.name      : testOnOffFrame
     * @tc.desc      : Unsubscribe from changes per frame after Subscribe to changes per frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testOnOffFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testOnOffFrame===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let callback = (frameInfo: displaySync.IntervalInfo) => {
          console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }
        backDisplaySync?.on("frame", callback)
        backDisplaySync?.off("frame", callback)
        console.info(msg + 'Succeeded in onoff.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_005
     * @tc.name      : testStart
     * @tc.desc      : Start callback per frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testStart===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let range : ExpectedFrameRateRange = {
          expected: 10,
          min:0,
          max:120
        };

        backDisplaySync?.setExpectedFrameRateRange(range)

        let callback = (frameInfo: displaySync.IntervalInfo) => {
            console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }

        backDisplaySync?.on("frame", callback)

        // 开始每帧回调
        backDisplaySync?.start()
        console.info(msg + 'Succeeded in onoff.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_006
     * @tc.name      : testStop
     * @tc.desc      : Stop callback per frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testStop===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let range : ExpectedFrameRateRange = {
          expected: 10,
          min:0,
          max:120
        };

        backDisplaySync?.setExpectedFrameRateRange(range)

        let callback = (frameInfo: displaySync.IntervalInfo) => {
            console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }

        backDisplaySync?.on("frame", callback)

        // 停止每帧回调
        backDisplaySync?.stop()
        console.info(msg + 'Succeeded in onoff.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_007
     * @tc.name      : testStartStop
     * @tc.desc      : Start and Stop
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testStartStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      let msg = "====testStartStop===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let range : ExpectedFrameRateRange = {
          expected: 10,
          min:0,
          max:120
        };

        backDisplaySync?.setExpectedFrameRateRange(range)

        let callback = (frameInfo: displaySync.IntervalInfo) => {
            console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp + ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
        }

        backDisplaySync?.on("frame", callback)

        backDisplaySync?.start()

        // 停止每帧回调
        backDisplaySync?.stop()
        console.info(msg + 'Succeeded in onoff.');
        done()        
      } catch (exception) {
        console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDISPLAYSYNC_JS_API_008
     * @tc.name      : testDisplaySyncErrprCode
     * @tc.desc      : setExpectedFrameRateRange error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testDisplaySyncErrprCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testStartStop===="
      console.log(msg + ' begin')
      try {
        let backDisplaySync: displaySync.DisplaySync = displaySync.create();
        let range : ExpectedFrameRateRange = {
          expected: -10,
          min:0,
          max:120
        };
        backDisplaySync?.setExpectedFrameRateRange(range)
        expect().assertFail();
        done();     
      } catch (err) {
        console.error(msg + 'Failed to onoff. Cause:' + err.code);
        expect(err.code == 401).assertTrue();
        done();
      }
    })
  })
}