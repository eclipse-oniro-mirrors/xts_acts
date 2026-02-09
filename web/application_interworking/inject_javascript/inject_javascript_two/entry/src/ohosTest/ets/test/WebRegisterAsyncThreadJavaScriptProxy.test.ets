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
import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebRegisterAsyncThreadJavaScriptProxy() {

  describe('ActsWebRegisterAsyncThreadJavaScriptProxyTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRegisterAsyncThreadJavaScriptProxy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebRegisterAsyncThreadJavaScriptProxy state success ' + JSON.stringify(pages));
        if (!("WebRegisterAsyncThreadJavaScriptProxy" == pages.name)) {
          console.info('get WebRegisterAsyncThreadJavaScriptProxy state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebRegisterAsyncThreadJavaScriptProxy page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebRegisterAsyncThreadJavaScriptProxy page error: ' + err);
      }
      await driver.waitForComponent(ON.id("RegisterAsyncThreadJavaScriptProxy"),10000);
      console.log('waitForComponent RegisterAsyncThreadJavaScriptProxy==>');
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
         console.info(`enable success`);
       }).catch((err: object) => {
         console.error(`failed to enable, ${err}`);
       })
      console.info('WebRegisterAsyncThreadJavaScriptProxy beforeEach start');
      done();
    })


    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy001
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0001
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag null permission null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAsyncThreadJavaScriptProxy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy001", 172850)
        Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy001", true, 172860, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy002
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0002
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag WebTagTest permission null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAsyncThreadJavaScriptProxy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy002", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy002", true, 172870, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })


    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy003
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0003
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag ArkWeb permission null 执行testNdkProxyObjMethod1  ARKWEB_JAVASCRIPT_STRING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAsyncThreadJavaScriptProxy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy003", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy003", true, 172880, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy004
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0004
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag ArkWeb permission null 执行testNdkProxyObjMethod2  ARKWEB_JAVASCRIPT_BOOL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAsyncThreadJavaScriptProxy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy004", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy004", true, 172890, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy005
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0005
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy  webTag ArkWeb permission null 执行window.ndkProxy.method3  ARKWEB_JAVASCRIPT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAsyncThreadJavaScriptProxy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy005", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy005", true, 172900, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })
    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy006
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0006
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag ArkWeb permission null 执行testNdkProxyObjMethod1 testNdkProxyObjMethod2  异步方法线程id相同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegisterAsyncThreadJavaScriptProxy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy006", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy006", true, 172910, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })


    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy007
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0007
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag ArkWeb permission https://www.example.com  访问网址，执行方法window.ndkProxy.method1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAsyncThreadJavaScriptProxy007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy007", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy007", true, 172920, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy008
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0008
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy webTag ArkWeb permission https://www.example.com  访问网址https://www.baidu.com，执行方法window.ndkProxy.method1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterAsyncThreadJavaScriptProxy008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy008", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy008", true, 172930, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

    /**
     * @tc.name   testRegisterAsyncThreadJavaScriptProxy009
     * @tc.number SUB_ACE_WEB_REGISTERASYNCTHREADJAVASCRIPTPROXY_NAPI_0009
     * @tc.desc   test RegisterAsyncThreadJavaScriptProxy  webTag ArkWeb permission https://www.example.com  访问网址https://www.baidu.com，再访问https://www.example.com 执行方法window.ndkProxy.method1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRegisterAsyncThreadJavaScriptProxy009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRegisterAsyncThreadJavaScriptProxy009", 172850)
      Utils.registerBaseEvent("testRegisterAsyncThreadJavaScriptProxy009", true, 172940, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RegisterAsyncThreadJavaScriptProxy', 10, '');
    })

  })
}