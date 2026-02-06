'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Resource,  Color, FontStyle, BlurStyle, $r } from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest, startAbility } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { BusinessError } from '@ohos.base';
import { MessageManager } from '../../../ets/MainAbility/common/MessageManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Context } from '@ohos.abilityAccessCtrl'
import {
  ArcSwiperAttribute,
  ArcSwiper,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@ohos.arkui.ArcSwiper'

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const expectedFamily = 'HarmonyOS Sans';

export default function ArcSwiperDemo() {
  describe('ArcSwiper01', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
      
      await UtilsTest.startAbility("com.example.myapplication.static", "EntryAbility");
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/ArcSwiper1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ArcSwiperPage state pages: " + JSON.stringify(pages));
        if (!("ArcSwiper" == pages.name)) {
          console.info("get ArcSwiper state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ArcSwiper page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    
    
/**
     * @tc.number   arcSwiperTest_static_001
     * @tc.name     arcSwiperTest_static_001
     * @tc.desc     arcSwiperTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('arcSwiperTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('arcSwiperTest001 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('arcSwiperTest001');
          console.info('arcSwiperTest001 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("arcSwiperTest001 component obj is: " + JSON.stringify(obj));
          console.info("arcSwiperTest001 component obj.$attrs is: " + JSON.stringify(obj.getString('$attrs')));

          console.info("arcSwiperTest001 component obj.getElement('$attrs').getString('index') is: " + obj.getElement('$attrs').getString('index'));
          console.info("arcSwiperTest001 component obj.getElement('$attrs').getString('effectMode') is: " + obj.getElement('$attrs').getString('effectMode'));

          expect(obj.getElement('$attrs').getString('index')).assertEqual('0');
          expect(obj.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.Spring');

          let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
          console.info("arcSwiperTest001 component obj2 arcDirection is: " + JSON.stringify(obj2.getString('arcDirection')));
          console.info("arcSwiperTest001 component obj2 itemColor is: " + JSON.stringify(obj2.getString('itemColor')));
          console.info("arcSwiperTest001 component obj2 selectedItemColor is: " +
          JSON.stringify(obj2.getString('selectedItemColor')));
          console.info("arcSwiperTest001 component obj2 backgroundColor is: " + JSON.stringify(obj2.getString('backgroundColor')));

          expect(obj2.getString('arcDirection')).assertEqual('ArcDirection.THREE_CLOCK_DIRECTION');
          expect(obj2.getString('itemColor')).assertEqual('#FFFF0000');
          expect(obj2.getString('selectedItemColor')).assertEqual('#FFFF0000');
          expect(obj2.getString('backgroundColor')).assertEqual('#FFFF0000');

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
