'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  $rawfile,
  Alignment,
  ClickEvent,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Path,
  Search,
  SearchController,
  Stack,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import Log from '../common/Log';
import Want from '@ohos.app.ability.Want';
import Ability from '@ohos.app.ability.UIAbility'
import { LocalStorage } from 'arkui.stateManagement.storage.localStorage'
import { AppStorage } from '@ohos.arkui.stateManagement';
import window from '@ohos.window'
import { BusinessError } from '@kit.BasicServicesKit';

export default class MainAbility extends Ability {
  storage?: LocalStorage
  windowClass: window.Window | undefined = undefined;

  onCreate(want: Want) {
    this.storage = new LocalStorage();
    this.storage?.setOrCreate("storageSimpleProp", 121);
    console.log("[Demo MainAbility onCreate]");
    AppStorage.setOrCreate<Want>('want', want)
  }

  onDestroy(): Promise<void> {
    console.log("[Demo MainAbility onDestroy]")
  }

  onWindowStageCreate() {
    try {
      this.windowClass!.setUIContent('pages/index', (err: BusinessError | null) => {
        const errCode: Int | undefined = err?.code;
        if (errCode) {
          console.error(`Failed to load the content. Cause code: ${err?.code}, message: ${err?.message}`);
          return;
        }
        console.info('Succeeded in loading the content.');
      });
    } catch (exception) {
      console.error(`Failed to load the content. Cause code: ${exception.code}, message: ${exception.message}`);
    }
    // window.setUIContent(this.context, "pages/index", this.storage)
  }

  onWindowStageDestroy() {
    console.log("[Demo] MainAbility onWindoeStageDestroy")
  }

  onForeground() {
    console.log("[Demo] MainAbility onForeground")
  }

  onBackground() {
    console.log("[Demo] MainAbility onBackground")
  }
}