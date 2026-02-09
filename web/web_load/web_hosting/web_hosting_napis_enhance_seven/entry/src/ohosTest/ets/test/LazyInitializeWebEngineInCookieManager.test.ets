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
import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import { URL_BAIDU } from './Config.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function LazyInitializeWebEngineInCookieManager() {

  describe('ActsLazyInitializeWebEngineInCookieManagerTest', () => {

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("LazyInitializeWebEngineInCookieManager beforeEach start");
      done();
    })

    /**
     * @tc.name   testLazyInitializeWebEngineInCookieManagerSetFalse
     * @tc.number SUB_WEB_LAZYINITIALIZEWEBENGINEINCOOKIEMANAGER_NAPI_0100
     * @tc.desc   test LazyInitializeWebEngineInCookieManager set false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyInitializeWebEngineInCookieManagerSetFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.log('testLazyInitializeWebEngineInCookieManagerSetFalse start')
        try {
            let ret = testNapi.lazyInitializeWebEngineInCookieManagerSetTrue();
            console.log('testLazyInitializeWebEngineInCookieManagerSetFalse ret :' + ret)
            let resultCode = testNapi.setConfigCookieSync(URL_BAIDU, 'myCookie=myCookieValue;Secure;HttpOnly', true, true)
            console.log('testLazyInitializeWebEngineInCookieManagerSetFalse setConfigCookieSync resultCode:' + resultCode)
            let resultValue = testNapi.getFetchCookieSync(URL_BAIDU, true, true)
            console.log('testLazyInitializeWebEngineInCookieManagerSetFalse getFetchCookieSync resultValue:' + resultValue)
            if (ret === 1 && resultCode === 0 &&  resultValue === 'myCookie=myCookieValue') {
                expect(ret).assertEqual(1)
            } else {
                expect(ret).assertEqual(0)
            }
        } catch(error) {
            console.error('testLazyInitializeWebEngineInCookieManagerSetFalse error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testLazyInitializeWebEngineInCookieManagerSetFalse end')
        done()
    })


    /**
     * @tc.name   testLazyInitializeWebEngineInCookieManagerSetTrue
     * @tc.number SUB_WEB_LAZYINITIALIZEWEBENGINEINCOOKIEMANAGER_NAPI_0200
     * @tc.desc   test LazyInitializeWebEngineInCookieManager set true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLazyInitializeWebEngineInCookieManagerSetTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.log('testLazyInitializeWebEngineInCookieManagerSetTrue start')
        try {
            let ret = testNapi.lazyInitializeWebEngineInCookieManagerSetTrue();
            console.log('testLazyInitializeWebEngineInCookieManagerSetTrue ret :' + ret)
            let resultCode = testNapi.setConfigCookieSync(URL_BAIDU, 'myCookie2=myCookieValue2;Secure;HttpOnly', true, true)
            console.log('testLazyInitializeWebEngineInCookieManagerSetTrue setConfigCookieSync resultCode:' + resultCode)
            let resultValue = testNapi.getFetchCookieSync(URL_BAIDU, true, true)
            console.log('testLazyInitializeWebEngineInCookieManagerSetTrue getFetchCookieSync resultValue:' + resultValue)
            if (ret === 1 && resultCode === 0 &&  resultValue === 'myCookie2=myCookieValue2') {
                expect(ret).assertEqual(1)
            } else {
                expect(ret).assertEqual(0)
            }
        } catch(error) {
            console.error('testLazyInitializeWebEngineInCookieManagerSetTrue error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testLazyInitializeWebEngineInCookieManagerSetTrue end')
        done()
    })


  })
}
