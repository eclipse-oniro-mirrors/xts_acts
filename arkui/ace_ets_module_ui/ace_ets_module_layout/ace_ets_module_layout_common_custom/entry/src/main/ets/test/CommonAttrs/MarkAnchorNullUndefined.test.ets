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

export default function MarkAnchorNullUndefinedTest() {
  describe('MarkAnchorNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("MarkAnchorNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/MarkAnchorNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MarkAnchorNullUndefined state success " + JSON.stringify(pages));
        if (!("MarkAnchorNullUndefined" == pages.name)) {
          console.info("get MarkAnchorNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push MarkAnchorNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MarkAnchorNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   MarkAnchorNullUndefinedTest_0100
     * @tc.number MarkAnchorNullUndefinedTest_0100
     * @tc.desc   test markAnchor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MarkAnchorNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('MarkAnchorNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('MarkAnchorNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MarkAnchorNullUndefinedTest_0100] obj.$attrs.markAnchor:' + JSON.stringify(obj.$attrs.markAnchor));
      expect(JSON.stringify(obj.$attrs.markAnchor)).assertEqual('{"x":"0.00vp","y":"0.00vp"}');
      console.info('MarkAnchorNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   MarkAnchorNullUndefinedTest_0200
     * @tc.number MarkAnchorNullUndefinedTest_0200
     * @tc.desc   test markAnchor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MarkAnchorNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('MarkAnchorNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('MarkAnchorNullUndefinedTest_4');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[MarkAnchorNullUndefinedTest_0200] obj.$attrs.markAnchor:' + JSON.stringify(obj.$attrs.markAnchor));
      expect(JSON.stringify(obj.$attrs.markAnchor)).assertEqual('{"x":"0.00vp","y":"0.00vp"}');
      console.info('MarkAnchorNullUndefinedTest_0200 END');
      done();
    });
  })
}

