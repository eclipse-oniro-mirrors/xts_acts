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
    describe('ArcSwiper001', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcSwiper/ArcSwiper1',
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

    it('arcSwiperTest001',  Level.LEVEL0, async (done: Function) => {
      console.info('arcSwiperTest001 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('arcSwiperTest001');
          console.info('arcSwiperTest001 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("arcSwiperTest001 component obj is: " + JSON.stringify(obj));
          console.info("arcSwiperTest001 component obj.$attrs is: " + JSON.stringify(obj.$attrs));

          console.info("arcSwiperTest001 component obj.$attrs.index is: " + obj.$attrs.index);
          console.info("arcSwiperTest001 component obj.$attrs.effectMode is: " + obj.$attrs.effectMode);

          expect(obj.$attrs.index).assertEqual('0');
          expect(obj.$attrs.effectMode).assertEqual('EdgeEffect.Spring');

          let obj2: ESObject = JSON.parse(obj.$attrs.indicator);
          console.info("arcSwiperTest001 component obj2 arcDirection is: " + JSON.stringify(obj2.arcDirection));
          console.info("arcSwiperTest001 component obj2 itemColor is: " + JSON.stringify(obj2.itemColor));
          console.info("arcSwiperTest001 component obj2 selectedItemColor is: " + JSON.stringify(obj2.selectedItemColor));
          console.info("arcSwiperTest001 component obj2 backgroundColor is: " + JSON.stringify(obj2.backgroundColor));

          expect(obj2.arcDirection).assertEqual('ArcDirection.THREE_CLOCK_DIRECTION');
          expect(obj2.itemColor).assertEqual('#FFFF0000');
          expect(obj2.selectedItemColor).assertEqual('#FFFF0000');
          expect(obj2.backgroundColor).assertEqual('#FFFF0000');

          console.info('arcSwiperTest001 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('arcSwiperTest001 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
