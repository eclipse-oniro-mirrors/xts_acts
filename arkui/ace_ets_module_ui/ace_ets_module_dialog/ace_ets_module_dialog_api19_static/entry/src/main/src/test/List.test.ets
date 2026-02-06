'use static';
/**
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
import alertDialogBackgroundEffectTest from './alertDialogTest/alertDialogBackgroundEffect.test'
import alertDialogBlurStyleOptionsTest from './alertDialogTest/alertDialogBlurStyleOptions.test'
import closeMenu from './promptActionTest/closeMenu.test.ets'
import customDialogBackgroundEffectTest from './customDialogTest/customDialogBackgroundEffect.test'
import customDialogBlurStyleOptionsTest from './customDialogTest/customDialogBlurStyleOptions.test'
import openCustomDialogBackgroundEffectTest from './promptActionTest/openCustomDialogBackgroundEffect.test'
import openCustomDialogBlurStyleOptionsTest from './promptActionTest/openCustomDialogBlurStyleOptions.test'
import openMenu from './promptActionTest/openMenu.test.ets'
import showAlertDialogBackgroundEffectTest from './UIContextTest/showAlertDialogBackgroundEffect.test'
import showAlertDialogBlurStyleOptionsTest from './UIContextTest/showAlertDialogBlurStyleOptions.test'
import showDialogBackgroundEffectTest from './promptActionTest/showDialogBackgroundEffect1.test'
import showDialogBlurStyleOptionsTest from './promptActionTest/showDialogBlurStyleOptions1.test'
import showDialogCallbackBackgroundEffectTest from './promptActionTest/showDialogBackgroundEffect2.test'
import showDialogCallbackBlurStyleOptionsTest from './promptActionTest/showDialogBlurStyleOptions2.test'
import UIOpenCustomDialogBackgroundEffectTest from './UIContextTest/openCustomDialogBackgroundEffect.test'
import UIOpenCustomDialogBlurStyleOptionsTest from './UIContextTest/openCustomDialogBlurStyleOptions.test'
import UIPresentCustomDialogBackgroundEffectTest from './UIContextTest/presentCustomDialogBackgroundEffect.test'
import UIPresentCustomDialogBlurStyleOptionsTest from './UIContextTest/presentCustomDialogBlurStyleOptions.test'
import UIShowDialogBackgroundEffectTest from './UIContextTest/showDialogBackgroundEffect1.test'
import UIShowDialogBlurStyleOptionsTest from './UIContextTest/showDialogBlurStyleOptions1.test'
import UIShowDialogCallbackBackgroundEffectTest from './UIContextTest/showDialogBackgroundEffect2.test'
import UIShowDialogCallbackBlurStyleOptionsTest from './UIContextTest/showDialogBlurStyleOptions2.test'
import updateMenu from './promptActionTest/updateMenu.test.ets'
import openMenuAnchorPositionTest from './promptActionTest/openMenuAnchorPosition.test'
import updateMenuAnchorPositionTest from './promptActionTest/updateMenuAnchorPosition.test'

export default function testsuite() {
    alertDialogBackgroundEffectTest()
    alertDialogBlurStyleOptionsTest()
    closeMenu()
    customDialogBackgroundEffectTest()
    customDialogBlurStyleOptionsTest()
    openCustomDialogBackgroundEffectTest()
    openCustomDialogBlurStyleOptionsTest()
    openMenu()
    showAlertDialogBackgroundEffectTest()
    showAlertDialogBlurStyleOptionsTest()
    showDialogBackgroundEffectTest()
    showDialogBlurStyleOptionsTest()
    showDialogCallbackBackgroundEffectTest()
    showDialogCallbackBlurStyleOptionsTest()
    UIOpenCustomDialogBackgroundEffectTest()
    UIOpenCustomDialogBlurStyleOptionsTest()
    UIPresentCustomDialogBackgroundEffectTest()
    UIPresentCustomDialogBlurStyleOptionsTest()
    UIShowDialogBackgroundEffectTest()
    UIShowDialogBlurStyleOptionsTest()
    UIShowDialogCallbackBackgroundEffectTest()
    UIShowDialogCallbackBlurStyleOptionsTest()
    updateMenu()
    openMenuAnchorPositionTest()
    updateMenuAnchorPositionTest()
}