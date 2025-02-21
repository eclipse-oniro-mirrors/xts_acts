/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function scroll_ScrollFrictionTest() {
  describe('scroll_ScrollFrictionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/Scroll_attribute/ScrollFrictionPage',
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
     * @tc.number SUB_ACE_SCROLL_SCROLLFRICTION_001
     * @tc.name testScrollFriction
     * @tc.desc set friction to -1
     */
    it('testScrollFriction', 0, async (done: Function) => {
      console.info('[testScrollFriction] START');
      globalThis.value.message.notify({
        name: 'friction', value: -1
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parse(scrollContainerStrJson).$type).assertEqual('Scroll');
      expect(JSON.parse(scrollContainerStrJson).$attrs.friction).assertEqual(0.75);
      console.info('[testScrollFriction] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_SCROLL_SCROLLFRICTION_002
     * @tc.name testScrollFriction
     * @tc.desc set friction to 10
     */
    it('testScrollFriction', 0, async (done: Function) => {
      console.info('[testScrollFriction] START');
      globalThis.value.message.notify({
        name: 'friction', value: 10
      })
      await CommonFunc.sleep(2000);
      let scrollContainerStrJson = getInspectorByKey('Scroll_ScrollFriction');
      expect(JSON.parse(scrollContainerStrJson).$type).assertEqual('Scroll');
      expect(JSON.parse(scrollContainerStrJson).$attrs.friction).assertEqual(10);
      console.info('[testScrollFriction] END');
      done();
    });
  })


}
