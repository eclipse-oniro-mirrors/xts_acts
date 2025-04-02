/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import InputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility';
import { KeyboardController } from './KeyboardController';

export default class InputKeyService extends InputMethodExtensionAbility {
  private keyboardController: KeyboardController;

  onCreate(want) {
    console.log("====>onCreate onCreate onCreate onCreate onCreate onCreate InputKeyService************************");

    this.keyboardController = new KeyboardController(this.context);
    this.keyboardController.onCreate();
  }

  onDestroy() {
    console.log("onDestroy InputKeyService**");
  }
}