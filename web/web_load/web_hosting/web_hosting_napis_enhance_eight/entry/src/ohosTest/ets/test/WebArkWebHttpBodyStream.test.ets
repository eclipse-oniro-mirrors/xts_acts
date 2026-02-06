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
import testNapi from 'libentry.so'
import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebArkWebHttpBodyStream() {

  describe('ActsWebArkWebHttpBodyStreamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebArkWebHttpBodyStream',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebArkWebHttpBodyStream state success " + JSON.stringify(pages));
        if (!("WebConfigCookieSync" == pages.name)) {
          console.info("get WebArkWebHttpBodyStream state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebArkWebHttpBodyStream page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebArkWebHttpBodyStream page error: " + err);
      }
      console.log("waitForComponent ArkWebHttpBodyStreamTest==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebArkWebHttpBodyStream beforeEach start");
      done();
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_SetAsyncReadCallback001
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_SETASYNCREADCALLBACK_0001
     * @tc.desc   test OH_ArkWebHttpBodyStream_SetAsyncReadCallback  ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOH_ArkWebHttpBodyStream_SetAsyncReadCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_SetAsyncReadCallback001", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_SetAsyncReadCallback001", 1, 147100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamAsyncReadCallback001
     * @tc.number SUB_ACE_WEB_ARKWEBHTTPBODYSTREAMASYNCREADCALLBACK_0001
     * @tc.desc   test ArkWebHttpBodyStreamAsyncReadCallback  OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkWebHttpBodyStreamAsyncReadCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("ArkWebHttpBodyStreamAsyncReadCallback001", 147101)
      Utils.registerBaseEvent("testArkWebHttpBodyStreamAsyncReadCallback001", 1, 147110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamAsyncReadCallback002
     * @tc.number SUB_ACE_WEB_ARKWEBHTTPBODYSTREAMASYNCREADCALLBACK_0002
     * @tc.desc   test ArkWebHttpBodyStreamAsyncReadCallback const ArkWeb_HttpBodyStream *httpBodyStream ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebHttpBodyStreamAsyncReadCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ArkWebHttpBodyStreamAsyncReadCallback002", 147101)
      Utils.registerBaseEvent("testArkWebHttpBodyStreamAsyncReadCallback002", 1, 147120, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamAsyncReadCallback003
     * @tc.number SUB_ACE_WEB_ARKWEBHTTPBODYSTREAMASYNCREADCALLBACK_0003
     * @tc.desc   test ArkWebHttpBodyStreamAsyncReadCallback uint8_t *buffer ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebHttpBodyStreamAsyncReadCallback003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ArkWebHttpBodyStreamAsyncReadCallback003", 147101)
      Utils.registerBaseEvent("testArkWebHttpBodyStreamAsyncReadCallback003", "hello", 147130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testArkWebHttpBodyStreamAsyncReadCallback004
     * @tc.number SUB_ACE_WEB_ARKWEBHTTPBODYSTREAMASYNCREADCALLBACK_0004
     * @tc.desc   test ArkWebHttpBodyStreamAsyncReadCallback int bytesRead ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebHttpBodyStreamAsyncReadCallback004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("ArkWebHttpBodyStreamAsyncReadCallback004", 147101)
      Utils.registerBaseEvent("testArkWebHttpBodyStreamAsyncReadCallback004", 1, 147140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead001
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0001
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead 执行方法 ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead001", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead001", 1, 147150, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead002
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0002
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead 子线程读取 ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead002", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead002", 1, 147160, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })
    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead003
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0003
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead call回调线程与读取线程非同一线程
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead003", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead003", 1, 147170, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead004
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0004
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body 文本类型数据 post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead004", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead004", "23", 147180, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead005
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0005
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body类型bytes post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead005", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead005", "hello", 147190, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead006
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0006
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body类型 blob post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead006", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead006", true, 147200, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead007
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0007
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body类型 chunked post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead007", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead007", 1, 147210, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead008
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0008
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body类型 ArrayBuffer post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead008", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead008", "DCB", 147220, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })


    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead009
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0009
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead http body类型 Document post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead009", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead009", "html>", 147230, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead010
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0010
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body 文本类型数据 post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead010", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead010", "23", 147240, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead011
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0011
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body类型bytes post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead011", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead011", "hello", 147250, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead012
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0012
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body类型 blob post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead012", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead012", true, 147260, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead013
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0013
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body类型 chunked post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead013", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead013", 1, 147270, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead014
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0014
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body类型 ArrayBuffer post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead014", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead014", "DCB", 147280, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })


    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead015
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0015
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https body类型 Document post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead015", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead015", "html>", 147290, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead016
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0016
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https postdata大小小于默认buffer post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead016", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead016", "hel", 147300, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })


    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead017
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0017
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https postdata大小等于默认buffer post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead017", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead017", "hellohello", 147310, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead018
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0018
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https postdata大小大于默认buffer post请求
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead018", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead018", "el", 147320, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead019
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0019
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https httpBodyStream空指针，读取内容为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead019", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead019", "hello", 147330, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead020
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0020
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead https bufLen等于0 读取内容为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebHttpBodyStream_AsyncRead020", 147101)
      Utils.registerBaseEvent("testOH_ArkWebHttpBodyStream_AsyncRead020", "", 147340, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebHttpBodyStreamTest",driver)
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_Min
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0021
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead  bufLen set 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_Min', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_Min start')
        try {
            let ret = testNapi.arkWebHttpBodyStreamAsyncReadBufLenMinValue();
            expect(ret).assertEqual(1)
        } catch(error) {
            console.error('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_Min error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_Min end')
        done()
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MinBoundary
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0022
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead  bufLen set -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MinBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MinBoundary start')
        try {
            let ret = testNapi.arkWebHttpBodyStreamAsyncReadBufLenMinBoundary();
            expect(ret).assertEqual(1)
        } catch(error) {
            console.error('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MinBoundary error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MinBoundary end')
        done()
    })

    /**
     * @tc.name   testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MaxBoundary
     * @tc.number SUB_ACE_WEB_OH_ARKWEBHTTPBODYSTREAM_ASYNCREAD_0023
     * @tc.desc   test OH_ArkWebHttpBodyStream_AsyncRead  bufLen set -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MaxBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MaxBoundary start')
        try {
            let ret = testNapi.arkWebHttpBodyStreamAsyncReadBufLenMaxBoundary();
            expect(ret).assertEqual(1)
        } catch(error) {
            console.error('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MaxBoundary error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testOH_ArkWebHttpBodyStream_AsyncRead_BufLen_MaxBoundary end')
        done()
    })

  })
}
