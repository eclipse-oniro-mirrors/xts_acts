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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  Level } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { ArcSwiperAttribute, ArcSwiper, ArcDotIndicator, ArcDirection, ArcSwiperController } from '@ohos.arkui.ArcSwiper'
interface optionsObj {
  uri: string
}

export default function ArcSwiperDemo() {
    describe('ArcSwiper', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcSwiper/ArcSwiper4',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ArcSwiperPage state pages: " + JSON.stringify(pages));
                if (!("ArcSwiper" == pages.name)) {
                    console.info("get ArcSwiper state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ArcSwiper page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ArcSwiper page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

    it('arcSwiperTest004',  Level.LEVEL0, async (done: Function) => {
      console.info('arcSwiperTest004 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('arcSwiperTest004');
          console.info('arcSwiperTest004 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("arcSwiperTest004 component obj is: " + JSON.stringify(obj));
          console.info("arcSwiperTest004 component obj.$attrs is: " + JSON.stringify(obj.$attrs));

          console.info("arcSwiperTest004 component obj.$attrs.index is: " + JSON.stringify(obj.$attrs.index));
          console.info("arcSwiperTest004 component obj.$attrs.duration is: " + JSON.stringify(obj.$attrs.duration));
          console.info("arcSwiperTest004 component obj.$attrs.vertical is: " + obj.$attrs.vertical);
          console.info("arcSwiperTest004 component obj.$attrs.effectMode is: " + obj.$attrs.effectMode);

          expect(obj.$attrs.index).assertEqual('0');
          expect(obj.$attrs.duration).assertEqual('400');
          expect(obj.$attrs.effectMode).assertEqual('EdgeEffect.Spring');

          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("arcSwiperTest004 component obj2 arcDirection is: " + JSON.stringify(obj2.arcDirection));
          console.info("arcSwiperTest004 component obj2 itemColor is: " + JSON.stringify(obj2.itemColor));
          console.info("arcSwiperTest004 component obj2 selectedItemColor is: " + JSON.stringify(obj2.selectedItemColor));
          console.info("arcSwiperTest004 component obj2 backgroundColor is: " + JSON.stringify(obj2.backgroundColor));
          console.info("arcSwiperTest004 component obj2 index is: " + JSON.stringify(obj2.index));

          expect(obj2.arcDirection).assertEqual('ArcDirection.SIX_CLOCK_DIRECTION');
          expect(obj2.itemColor).assertEqual('#A9FFFFFF');
          expect(obj2.selectedItemColor).assertEqual('#FF5EA1FF');
          expect(obj2.backgroundColor).assertEqual('#FF404040');
          

          console.info('arcSwiperTest004 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('arcSwiperTest004 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
