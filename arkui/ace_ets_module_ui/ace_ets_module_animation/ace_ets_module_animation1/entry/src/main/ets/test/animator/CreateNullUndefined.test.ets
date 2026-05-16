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
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/utils/Common';

export default function CreateNullUndefinedTest() {
  describe('CreateNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CreateNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/animator/CreateNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CreateNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("CreateNullUndefined" == pages.name)) {
          console.info("get CreateNullUndefinedTest state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CreateNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CreateNullUndefinedTest page error:" + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CreateNullUndefinedTest after each called");
    });

    /**
     * @tc.name   animatorApi9CreateNullUndefined_0100
     * @tc.number SUB_ARKUI_ANIMATOR_API9_CREATE_NULL_0100
     * @tc.desc   Test API 9 create method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi9CreateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[animatorApi9CreateNullUndefined_0100] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api9_create_null'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi9CreateNullUndefined_0100] Called API 9 create with null');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi9CreateNullUndefined_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[animatorApi9CreateNullUndefined_0100] END');
    })

    /**
     * @tc.name   animatorApi9CreateNullUndefined_0200
     * @tc.number SUB_ARKUI_ANIMATOR_API9_CREATE_NULL_0200
     * @tc.desc   Test API 9 create method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi9CreateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[animatorApi9CreateNullUndefined_0200] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api9_create_undefined'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi9CreateNullUndefined_0200] Called API 9 create with undefined');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi9CreateNullUndefined_0200] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }

      console.info('[animatorApi9CreateNullUndefined_0200] END');
    })

    /**
     * @tc.name   animatorApi18CreateNullUndefined_0100
     * @tc.number SUB_ARKUI_ANIMATOR_API18_CREATE_NULL_0100
     * @tc.desc   Test API 18 create method with AnimatorOptions null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi18CreateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[animatorApi18CreateNullUndefined_0100] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api18_create_null'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi18CreateNullUndefined_0100] Called API 18 create with AnimatorOptions null');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi18CreateNullUndefined_0100] ERROR: ' + JSON.stringify(error));
      }

      console.info('[animatorApi18CreateNullUndefined_0100] END');
    })

    /**
     * @tc.name   animatorApi18CreateNullUndefined_0200
     * @tc.number SUB_ARKUI_ANIMATOR_API18_CREATE_NULL_0200
     * @tc.desc   Test API 18 create method with AnimatorOptions undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi18CreateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[animatorApi18CreateNullUndefined_0200] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api18_create_undefined'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi18CreateNullUndefined_0200] Called API 18 create with AnimatorOptions undefined');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi18CreateNullUndefined_0200] ERROR: ' + JSON.stringify(error));
      }

      console.info('[animatorApi18CreateNullUndefined_0200] END');
    })

    /**
     * @tc.name   animatorApi18CreateNullUndefined_0300
     * @tc.number SUB_ARKUI_ANIMATOR_API18_CREATE_NULL_0300
     * @tc.desc   Test API 18 create method with SimpleAnimatorOptions null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi18CreateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[animatorApi18CreateNullUndefined_0300] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api18_create_simple_null'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi18CreateNullUndefined_0300] Called API 18 create with SimpleAnimatorOptions null');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi18CreateNullUndefined_0300] ERROR: ' + JSON.stringify(error));
      }

      console.info('[animatorApi18CreateNullUndefined_0300] END');
    })

    /**
     * @tc.name   animatorApi18CreateNullUndefined_0400
     * @tc.number SUB_ARKUI_ANIMATOR_API18_CREATE_NULL_0400
     * @tc.desc   Test API 18 create method with SimpleAnimatorOptions undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('animatorApi18CreateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[animatorApi18CreateNullUndefined_0400] START');

      try {
        await CommonFunc.sleep(1000)
        let driver = await Driver.create()
        let btn = await driver.findComponent(ON.id('btn_api18_create_simple_undefined'));
        await btn.click();
        await CommonFunc.sleep(500);

        console.info('[animatorApi18CreateNullUndefined_0400] Called API 18 create with SimpleAnimatorOptions undefined');
        let errCode: string | undefined = AppStorage.get('errCode')
        expect(errCode == '401').assertTrue();
        AppStorage.delete('errCode')
      } catch (error) {
        console.info('[animatorApi18CreateNullUndefined_0400] ERROR: ' + JSON.stringify(error));
      }

      console.info('[animatorApi18CreateNullUndefined_0400] END');
    })
  })
}
