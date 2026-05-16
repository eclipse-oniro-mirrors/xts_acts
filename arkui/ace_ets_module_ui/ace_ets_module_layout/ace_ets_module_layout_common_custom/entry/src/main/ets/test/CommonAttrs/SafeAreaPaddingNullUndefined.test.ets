/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function SafeAreaPaddingNullUndefinedTest() {
  describe('SafeAreaPaddingNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("SafeAreaPaddingNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/SafeAreaPaddingNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaPaddingNullUndefined state success " + JSON.stringify(pages));
        if (!("SafeAreaPaddingNullUndefined" == pages.name)) {
          console.info("get SafeAreaPaddingNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SafeAreaPaddingNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SafeAreaPaddingNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   SafeAreaPaddingNullUndefinedTest_0100
     * @tc.number SafeAreaPaddingNullUndefinedTest_0100
     * @tc.desc   test safeAreaPadding with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SafeAreaPaddingNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SafeAreaPaddingNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('SafeAreaPaddingNullUndefinedTest_2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SafeAreaPaddingNullUndefinedTest_0100] obj.$attrs.safeAreaPadding:' + obj.$attrs.safeAreaPadding);
      expect(obj.$attrs.safeAreaPadding).assertEqual('0.00vp');
      console.info('SafeAreaPaddingNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   SafeAreaPaddingNullUndefinedTest_0200
     * @tc.number SafeAreaPaddingNullUndefinedTest_0200
     * @tc.desc   test safeAreaPadding with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SafeAreaPaddingNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('SafeAreaPaddingNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('SafeAreaPaddingNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SafeAreaPaddingNullUndefinedTest_0200] obj.$attrs.safeAreaPadding:' + obj.$attrs.safeAreaPadding);
      expect(obj.$attrs.safeAreaPadding).assertEqual('0.00vp');
      console.info('SafeAreaPaddingNullUndefinedTest_0200 END');
      done();
    });
  })
}

