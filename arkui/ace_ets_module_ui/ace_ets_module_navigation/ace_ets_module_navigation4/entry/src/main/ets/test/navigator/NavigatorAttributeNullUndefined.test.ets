/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavigatorAttributeNullUndefinedTest() {
  describe('NavigatorAttributeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('NavigatorAttributeNullUndefined beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigator/NavigatorAttributeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavigatorAttributeNullUndefined state pages:' + JSON.stringify(pages));
        if (!('NavigatorAttributeNullUndefined' == pages.name)) {
          console.info('get NavigatorAttributeNullUndefined pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavigatorAttributeNullUndefined page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavigatorAttributeNullUndefined page error:' + err);
      }
      console.info('NavigatorAttributeNullUndefined beforeEach end');
      done();
    });

    /**
     * @tc.name   navigatorParams_null_0100
     * @tc.number SUB_ARKUI_NAVIGATOR_PARAMS_NULL_0100
     * @tc.desc   Test Navigator params property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navigatorParams_null_0100', Level.LEVEL2, async () => {
      console.info('[navigatorParams_null_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('Navigator_params_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('Navigator_params_null');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigatorParams_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigatorParams_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
        console.info("[navigatorParams_null_0100] default params is: " + JSON.stringify(objCompare.$attrs.params));
        console.info("[navigatorParams_null_0100] null params is: " + JSON.stringify(obj.$attrs.params));

        // null should restore to default value
        expect(obj.$attrs.params).assertEqual('null');
        console.info('[navigatorParams_null_0100] Navigator params with null restores to default');
      } catch (error) {
        console.info('[navigatorParams_null_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigatorParams_null_0100] END');
    })

    /**
     * @tc.name   navigatorParams_undefined_0100
     * @tc.number SUB_ARKUI_NAVIGATOR_PARAMS_UNDEFINED_0100
     * @tc.desc   Test Navigator params property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('navigatorParams_undefined_0100', Level.LEVEL2, async () => {
      console.info('[navigatorParams_undefined_0100] START');

      try {
        let strJsonCompare: string = getInspectorByKey('Navigator_params_default');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
        let strJson: string = getInspectorByKey('Navigator_params_undefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[navigatorParams_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[navigatorParams_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
        console.info("[navigatorParams_undefined_0100] default params is: " + JSON.stringify(objCompare.$attrs.params));
        console.info("[navigatorParams_undefined_0100] undefined params is: " + JSON.stringify(obj.$attrs.params));

        // undefined should restore to default value
        expect(obj.$attrs.params).assertEqual('undefined');
        console.info('[navigatorParams_undefined_0100] Navigator params with undefined restores to default');
      } catch (error) {
        console.info('[navigatorParams_undefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[navigatorParams_undefined_0100] END');
    })
  })
}
