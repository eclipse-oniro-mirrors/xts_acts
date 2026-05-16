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

export default function OffsetNullUndefinedTest() {
  describe('OffsetNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("OffsetNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/OffsetNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OffsetNullUndefined state success " + JSON.stringify(pages));
        if (!("OffsetNullUndefined" == pages.name)) {
          console.info("get OffsetNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OffsetNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OffsetNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   OffsetNullUndefinedTest_0100
     * @tc.number OffsetNullUndefinedTest_0100
     * @tc.desc   test offset with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OffsetNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('OffsetNullUndefinedTest_0100 START');

      let strJson = getInspectorByKey('OffsetNullUndefinedTest_3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OffsetNullUndefinedTest_0100] obj.$attrs.offset:' + JSON.stringify(obj.$attrs.offset));
      expect(JSON.stringify(obj.$attrs.offset)).assertEqual('{"x":"0.00vp","y":"0.00vp"}');
      console.info('OffsetNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   OffsetNullUndefinedTest_0200
     * @tc.number OffsetNullUndefinedTest_0200
     * @tc.desc   test offset with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OffsetNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('OffsetNullUndefinedTest_0200 START');

      let strJson = getInspectorByKey('OffsetNullUndefinedTest_4');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OffsetNullUndefinedTest_0200] obj.$attrs.offset:' + JSON.stringify(obj.$attrs.offset));
      expect(JSON.stringify(obj.$attrs.offset)).assertEqual('{"x":"0.00vp","y":"0.00vp"}');
      console.info('OffsetNullUndefinedTest_0200 END');
      done();
    });
  })
}

