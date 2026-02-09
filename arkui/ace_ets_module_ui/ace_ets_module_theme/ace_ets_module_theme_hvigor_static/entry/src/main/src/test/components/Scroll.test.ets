'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import { colorValuesKey } from '../../../ets/MainAbility/pages/index/index';
import {
  ScrollKeys,
  ScrollTextKeys,
  scrollThemeProperty,
  scrollThemeSetProperty
} from '../../../ets/MainAbility/pages/components/ScrollPage';
import { brownCustomTheme, greenCustomTheme, redCustomTheme } from '../../../ets/MainAbility/themes/CustomTheme1';
import { frameTime, sleep } from '../Utils.test';
import { CustomTheme, Theme } from '@ohos.arkui.theme';
import { ResourceColor } from '@ohos.arkui.component'

const EMPTY_CHECK: string = 'emptyCheck';
const EMPTY_ATTR: string = 'emptyAttr';

export default function scrollThemeTest() {
  const SUITE: string = `ScrollThemeTest`

  let localTheme: CustomTheme | undefined
  let changeTheme: boolean = false
  let themeSet = true

  const scrollTextKeys: string[] = [
    ScrollTextKeys.verticalScrollTextSystem,
    ScrollTextKeys.verticalScrollTextWithTheme,
    ScrollTextKeys.verticalScrollBarTextSystem,
    ScrollTextKeys.verticalScrollBarTextWithTheme,
    ScrollTextKeys.horizontalScrollTextSystem,
    ScrollTextKeys.horizontalScrollTextWithTheme,
    ScrollTextKeys.horizontalScrollBarTextSystem,
    ScrollTextKeys.horizontalScrollBarTextWithTheme
  ]

  const scrollKeys: string[] = [
    ScrollKeys.verticalScrollSystem,
    ScrollKeys.verticalScrollWithTheme,
    ScrollKeys.verticalScrollSystemCustomAttrs,
    ScrollKeys.verticalScrollWithThemeCustomAttrs,
    ScrollKeys.horizontalScrollSystem,
    ScrollKeys.horizontalScrollWithTheme,
    ScrollKeys.horizontalScrollSystemCustomAttrs,
    ScrollKeys.horizontalScrollWithThemeCustomAttrs
  ]

  let colorValues: Map<string, string> | undefined = new Map<string, string>()

  describe(SUITE, () => {
    beforeAll(async () => {
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    })

    beforeEach(() => {
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        const options: router.RouterOptions = {
          url: `MainAbility/pages/components/ScrollPage`,
        }
        const pages: router.RouterState = routerInstance.getState()
        if (pages?.name !== `ScrollPage`) {
          routerInstance.pushUrl(options).then(() => {
            localTheme = AppStorage.get<CustomTheme>('ScrollThemeProperty')
            console.info(`${SUITE} router.pushUrl success`)
          })
        }
        colorValues = AppStorage.get<Map<string, string> | undefined>('ColorValues');
      } catch (err) {
        console.error(`${SUITE} beforeAll error:` + JSON.stringify(err))
      }

      AppStorage.setOrCreate<boolean | undefined>('ScrollThemeSetProperty', themeSet)
      if (changeTheme) {
        if ((AppStorage.get<CustomTheme>('ScrollThemeProperty'))?.colors?.fontPrimary
          == redCustomTheme?.colors?.fontPrimary) {
          AppStorage.setOrCreate<CustomTheme>('ScrollThemeProperty', greenCustomTheme)
        } else {
          AppStorage.setOrCreate<CustomTheme>('ScrollThemeProperty', redCustomTheme)
        }
        changeTheme = false
      }
      localTheme =
        AppStorage.get<boolean>('ScrollThemeSetProperty') ? AppStorage.get<CustomTheme>('ScrollThemeProperty') : undefined
    })

    
    /**
     * @tc.number   ActsScrollThemeColors_static_0100
     * @tc.name     ActsScrollThemeColors_static_0100
     * @tc.desc     ActsScrollThemeColors_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActsScrollThemeColors_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsScrollThemeColors_static_0100`
      console.info(`${SUITE} ${CASE} START`)
      scrollKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return
        }
        checkScrollWithTheme(key, undefined, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`WithTheme`) > 0) {
          return
        }
        checkTextWithTheme(key, undefined, colorValues)
      })
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    })
    
    /**
     * @tc.number   ActsScrollThemeColors_static_0200
     * @tc.name     ActsScrollThemeColors_static_0200
     * @tc.desc     ActsScrollThemeColors_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ActsScrollThemeColors_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
        try {
      const CASE: string = `ActsScrollThemeColors_static_0200`
      console.info(`${SUITE} ${CASE} START`)
      scrollKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return
        }
        checkScrollWithTheme(key, localTheme, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`System`) > 0) {
          return
        }
        checkTextWithTheme(key, localTheme, colorValues)
      })
      changeTheme = true
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    })

    /**
     * @tc.number   ActsScrollThemeColors_static_0300
     * @tc.name     ActsScrollThemeColors_static_0300
     * @tc.desc     ActsScrollThemeColors_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('ActsScrollThemeColors_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
              try {
      const CASE: string = `ActsScrollThemeColors_static_0300`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      scrollKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkScrollWithTheme(key, localTheme, key.search(`CustomAttrs`) > 0, colorValues)
        }
      })
      scrollTextKeys.forEach((key) => {
        if (key.search(`System`) <= 0) {
          checkTextWithTheme(key, localTheme, colorValues)
        }

      })
      themeSet = false
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    })

    /**
     * @tc.number   ActsScrollThemeColors_static_0400
     * @tc.name     ActsScrollThemeColors_static_0400
     * @tc.desc     ActsScrollThemeColors_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('ActsScrollThemeColors_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
              try {
      const CASE: string = `ActsScrollThemeColors_static_0400`
      console.info(`${SUITE} ${CASE} START`)
      await sleep(frameTime)
      scrollKeys.forEach((key) => {
        checkScrollWithTheme(key, undefined, key.search(`CustomAttrs`) > 0, colorValues)
      })
      scrollTextKeys.forEach((key) => {
        checkTextWithTheme(key, undefined, colorValues)
      })
      themeSet = true
      console.info(`${SUITE} ${CASE} END`)
} catch (err) {
          expect().assertFail()
}
      done();
    })
  })
}

function checkScrollWithTheme(key: string, localTheme: CustomTheme | undefined, customAttrs: boolean,
  colorValues: Map<string, string> | undefined) {
  const ScrollJSON = inspector.getInspectorByKey(key)
  const attrsScroll = JSON.parseJsonElement(ScrollJSON).getElement('$attrs')
  const scrollBarColor = attrsScroll.getString('scrollBarColor').toString().toUpperCase() ?? EMPTY_ATTR
  const checkScrollBarColor = ((customAttrs ? brownCustomTheme : localTheme)?.colors?.compFocusedTertiary
    ?? colorValues?.get(`compFocusedTertiary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK
  expect(scrollBarColor).assertEqual(checkScrollBarColor)
}

function checkTextWithTheme(key: string, localTheme: CustomTheme | undefined,
  colorValues: Map<string, string> | undefined) {
  const textJSON = inspector.getInspectorByKey(key)
  const attrsText = JSON.parseJsonElement(textJSON).getElement('$attrs')
  const fontColor: ResourceColor = attrsText.getString('fontColor').toUpperCase() ?? EMPTY_ATTR;
  const checkFontColor = (localTheme?.colors?.fontPrimary
    ?? colorValues?.get(`fontPrimary`))?.toString().toUpperCase()
    ?? EMPTY_CHECK
  expect(fontColor).assertEqual(checkFontColor)
}