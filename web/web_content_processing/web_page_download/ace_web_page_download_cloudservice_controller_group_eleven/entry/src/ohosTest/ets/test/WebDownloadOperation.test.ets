/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = ''

export default function webDownloadOperation() {
  describe('webDownloadOperation', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadOperation',
      }
      try {
        await Utils.sleep(500)
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!('webDownloadOperation' == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(800);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error: ' + err);
      }
      await Utils.sleep(500)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(300);
      done();
    });

    afterEach(async () => {
      await Utils.sleep(600);
      console.info('web afterEach start:' + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('start send emitKey');
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info('emit emitKey  err: ' + JSON.stringify(err));
      }
    })

    afterAll(() => {
    })

    /**
     * @tc.number testWebView_cancel0100
     * @tc.name SUB_ACE_WEB_cancel_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_cancel_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_cancel_0100', '4', 450, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_ACE_WEB_cancel_0100', 10)
      await Utils.sleep(1000);
      sendEventByKey('config', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('pause11', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_cancel0200
     * @tc.name SUB_ACE_WEB_cancel_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_cancel_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_cancel_0200', '4', 451, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_ACE_WEB_cancel_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_cancel0300
     * @tc.name SUB_ACE_WEB_cancel_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_cancel_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_cancel_0300', '4', 452, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_ACE_WEB_cancel_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_cancel0400
     * @tc.name SUB_ACE_WEB_cancel_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_cancel_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_cancel_0400', '4', 453, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });

      Utils.emitEvent('SUB_ACE_WEB_cancel_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_pause0100
     * @tc.name SUB_ACE_WEB_pause_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0100', '17100019The download task is not started yet.', 454, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('pause11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_pause0200
     * @tc.name SUB_ACE_WEB_pause_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0200', '17100019The download task is not started yet.', 455, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('pause11', 10, '');
    })


    /**
     * @tc.number testWebView_pause0300
     * @tc.name SUB_ACE_WEB_pause_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0300', '17100019The download task is not started yet.', 456, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('pause11', 10, '');
    })

    /**
     * @tc.number testWebView_pause0400
     * @tc.name SUB_ACE_WEB_pause_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0400', '4', 457, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('pause11', 10, '');
      await Utils.sleep(500);
      sendEventByKey('resume11', 10, '');
      await Utils.sleep(500);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_pause0500
     * @tc.name SUB_ACE_WEB_pause_0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0500', '17100019The download task is not started yet.', 458, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0500', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('pause11', 10, '');
    })

    /**
     * @tc.number testWebView_pause0600
     * @tc.name SUB_ACE_WEB_pause_0600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_pause_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_pause_0600', '17100019The download task is not started yet.', 459, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_pause_0600', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('setConnectionTimeout', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('pause11', 10, '');
    })

    /**
     * @tc.number testWebView_resume0100
     * @tc.name SUB_ACE_WEB_resume_0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_resume_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_resume_0100', '17100016The download task is not paused.', 460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_resume_0100', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('resume11', 10, '');
    })

    /**
     * @tc.number testWebView_resume0200
     * @tc.name SUB_ACE_WEB_resume_0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_resume_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_resume_0200', '17100016The download task is not paused.', 461, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_resume_0200', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('start', 10, '');
      await Utils.sleep(200);
      sendEventByKey('resume11', 10, '');
    })

    /**
     * @tc.number testWebView_resume0300
     * @tc.name SUB_ACE_WEB_resume_0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_resume_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_resume_0300', '17100016The download task is not paused.', 462, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_resume_0300', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('start', 10, '');
      await Utils.sleep(200);
      sendEventByKey('cancel11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('resume11', 10, '');
    })

    /**
     * @tc.number testWebView_resume0400
     * @tc.name SUB_ACE_WEB_resume_0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_resume_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_resume_0400', '17100016The download task is not paused.', 463, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_resume_0400', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('start', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('resume11', 10, '');
    })

    /**
     * @tc.number testWebView_resume0500
     * @tc.name SUB_ACE_WEB_resume_0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_resume_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_resume_0500', '17100016The download task is not paused.', 464, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_resume_0500', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(2000);
      sendEventByKey('resume11', 10, '');
    })


    /**
     * @tc.number testWebView_onDownloadUpdated1000
     * @tc.name SUB_ACE_onDownloadUpdated_1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_onDownloadUpdated_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_onDownloadUpdated_1000', 22, 465, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1000', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
    })

    /**
     * @tc.number testWebView_onDownloadUpdated1001
     * @tc.name SUB_ACE_onDownloadUpdated_1001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_onDownloadUpdated_1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_onDownloadUpdated_1001', true, 466, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1001', 10)
      await Utils.sleep(1000);
      sendEventByKey('config', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('start', 10, '');
    })

    /**
     * @tc.number testWebView_onDownloadUpdated1002
     * @tc.name SUB_ACE_onDownloadUpdated_1002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_onDownloadUpdated_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_onDownloadUpdated_1002', 100, 467, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1002', 10)
      await Utils.sleep(1000);
      sendEventByKey('config', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('start', 10, '');
    })

    /**
     * @tc.number testWebView_onDownloadUpdated1003
     * @tc.name SUB_ACE_onDownloadUpdated_1003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_onDownloadUpdated_1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_onDownloadUpdated_1003', 2, 468, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1003', 10)
      await Utils.sleep(1000);
      sendEventByKey('config', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('start', 10, '');
      await Utils.sleep(10000);
      sendEventByKey('resume11', 10, '');
      await Utils.sleep(1000);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_onDownloadUpdated1004
     * @tc.name SUB_ACE_onDownloadUpdated_1004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_onDownloadUpdated_1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_onDownloadUpdated_1004', 2, 468, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_onDownloadUpdated_1003', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(6000);
      sendEventByKey('resume11', 10, '');
      await Utils.sleep(300);
      sendEventByKey('state11', 10, '');
    })


    /**
     * @tc.number testWebView_onDownloadFinish1000
     * @tc.name SUB_ACE_WEB_onDownloadFinish_1000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_onDownloadFinish_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_onDownloadFinish_1000', '4', 469, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_onDownloadFinish_1000', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(4000);
      sendEventByKey('state11', 10, '');
    })

    /**
     * @tc.number testWebView_onDownloadFinish1002
     * @tc.name SUB_ACE_WEB_onDownloadFinish_1002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("SUB_ACE_WEB_onDownloadFinish_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.registerBaseEvent('SUB_ACE_WEB_onDownloadFinish_1002', '4', 470, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('SUB_ACE_WEB_onDownloadFinish_1002', 10)
      await Utils.sleep(200);
      sendEventByKey('config', 10, '');
      await Utils.sleep(200);
      sendEventByKey('start', 10, '');
      await Utils.sleep(4000);
      sendEventByKey('pause11', 10, '');
      await Utils.sleep(200);
      sendEventByKey('state11', 10, '');
    })

  })
}