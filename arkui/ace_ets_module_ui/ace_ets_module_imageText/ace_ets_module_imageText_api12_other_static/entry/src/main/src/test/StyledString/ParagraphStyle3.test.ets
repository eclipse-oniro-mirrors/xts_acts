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

import router from '@ohos.router';

import { Driver, ON, MouseButton } from '@ohos.UiTest';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  LeadingMarginPlaceholder,
  FontWeight,
  TextAlign,
  WordBreak,
  TextOverflow
} from '@ohos.arkui.component';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ParagraphStyle3() {
  describe('ParagraphStyle3', () => {
    beforeAll(() => {
      console.info("ParagraphStyle3 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ParagraphStyle3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/ParagraphStyle3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ParagraphStyle3 state pages:" + JSON.stringify(pages));
        if (!("ParagraphStyle3" == pages.name)) {
          console.info("get ParagraphStyle3 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParagraphStyle3 page error: " + err);
      }
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParagraphStyle3 after each called");
    });


    
    
    


/**
     * @tc.number   ParagraphStyle_static_30001
     * @tc.name     ParagraphStyle_static_30001
     * @tc.desc     ParagraphStyle_static_30001
     * @tc.level    Level.LEVEL1
     */
it('ParagraphStyle_static_30001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('StyledString ParagraphStyle_static_30001 START');
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('text'))
      await CommonFunc.sleep(500);
      get!.click()
      await CommonFunc.sleep(500);
      console.info('StyledString ParagraphStyle10001 StyledString5_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString5_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString5_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString5_textIndent ' +
      AppStorage.get<undefined | number>('StyledString5_textIndent'));
      expect('' + AppStorage.get<undefined | number>('StyledString5_textIndent')).assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString5_maxLines ' +
      AppStorage.get<undefined | int>('StyledString5_maxLines'));
      expect('' + AppStorage.get<undefined | int>('StyledString5_maxLines')).assertEqual('-5');
      console.info('StyledString ParagraphStyle10001 StyledString5_wordBreak ' +
      AppStorage.get<undefined | WordBreak>('StyledString5_wordBreak'));
      expect('' + AppStorage.get<undefined | WordBreak>('StyledString5_wordBreak')).assertEqual('2');
      console.info('StyledString ParagraphStyle10001 StyledString5_leadingMargin ' +
      AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString5_lea'));
      expect('' + AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString5_leadingMargin'))
        .assertEqual('undefined');
      console.info('StyledString ParagraphStyle10001 StyledString5_overflow ' +
      AppStorage.get<undefined | TextOverflow>('StyledString5_overflow'));
      expect('' + AppStorage.get<undefined | TextOverflow>('StyledString5_overflow')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString6_textAlign ' +
      AppStorage.get<undefined | TextAlign>('StyledString6_textAlign'));
      expect('' + AppStorage.get<undefined | TextAlign>('StyledString6_textAlign')).assertEqual('0');
      console.info('StyledString ParagraphStyle10001 StyledString6_leadingMargin ' +
      AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString6_leadingMargin'));
      expect('' + AppStorage.get<undefined | Double | LeadingMarginPlaceholder>('StyledString6_leadingMargin'))
        .assertEqual('30');
      AppStorage.delete('StyledString5_textAlign')
      AppStorage.delete('StyledString5_textIndent')
      AppStorage.delete('StyledString5_maxLines')
      AppStorage.delete('StyledString5_wordBreak')
      AppStorage.delete('StyledString5_leadingMargin')
      AppStorage.delete('StyledString5_overflow')
      AppStorage.delete('StyledString6_textAlign')
      AppStorage.delete('StyledString6_leadingMargin')
      console.info("[ParagraphStyle_static_30001] end");
      done();
    });
  })
}