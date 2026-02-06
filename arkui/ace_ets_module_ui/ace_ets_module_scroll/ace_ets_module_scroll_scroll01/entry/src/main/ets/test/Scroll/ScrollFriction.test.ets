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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function ScrollFrictionTest() {
  describe('ScrollFrictionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/ScrollFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollFrictionPage state pages:" + JSON.stringify(pages));
        if (!("ScrollFrictionPage" == pages.name)) {
          console.info("get Scroll_ScrollInitialIndex1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollFrictionPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollFrictionPage page error:" + err);
      }
      console.info("ScrollFrictionPage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ScrollFrictionPage after each called");
    });
    /**
     * @tc.name   testScrollFriction_0100
     * @tc.number testScrollFriction_0100
     * @tc.desc   set friction to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollFriction_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[testScrollFriction_0100] START');
      globalThis.value.message.notify({
        name: 'friction', value: -1
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parse(scrollContainerStrJson).$type).assertEqual('Scroll');
      console.info('[testScrollFriction_0100] scrollContainerStrJson friction: ' + JSON.parse(scrollContainerStrJson).$attrs.friction);
      let scrollDefJson = getInspectorByKey('scroll_friction_default');
      console.info('[testScrollFriction_0100] scrollDefJson friction: ' + JSON.parse(scrollDefJson).$attrs.friction);
      expect(JSON.parse(scrollContainerStrJson).$attrs.friction).assertEqual(JSON.parse(scrollDefJson).$attrs.friction);
      console.info('[testScrollFriction_0100] END');
      done();
    });

    /**
     * @tc.name   testScrollFriction_0200
     * @tc.number testScrollFriction_0200
     * @tc.desc   set friction to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollFriction_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[testScrollFriction_0200] START');
      globalThis.value.message.notify({
        name: 'friction', value: 10
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parse(scrollContainerStrJson).$type).assertEqual('Scroll');
      expect(JSON.parse(scrollContainerStrJson).$attrs.friction).assertEqual(10);
      console.info('[testScrollFriction_0200] END');
      done();
    });
  })
}
