/*
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

import photoPickerCallback from './photoPickerCallback.test.ets'
import photoPickerPromise from './photoPickerPromise.test.ets'
import documentPickerCallback from './documentPickerCallback.test.ets'
import documentPickerPromise from './documentPickerPromise.test.ets'
import audioPickerCallback from './audioPickerCallback.test.ets'
import audioPickerPromise from './audioPickerPromise.test.ets'
import globalContext from '../test/GlobalContext'
import common from '@ohos.app.ability.common'
import EmptyTest from './Empty.test.ets'

export default function testsuite() {
  if (canIUse("SystemCapability.FileManagement.UserFileService")){
    photoPickerCallback(globalContext.getContext().getAbility())
    photoPickerPromise(globalContext.getContext().getAbility())
    documentPickerCallback(globalContext.getContext().getAbility())
    documentPickerPromise(globalContext.getContext().getAbility())
    audioPickerCallback(globalContext.getContext().getAbility())
    audioPickerPromise(globalContext.getContext().getAbility())
  }else{
      EmptyTest()
  }
  /*
  globalContext.getContext().setObject("ui", a.UIAbilityContext)
  globalContext.getContext().setObject("ui", common.UIAbilityContext)
  globalContext.getContext().setObject("con", new common.context)
  photoPickerCallback(globalContext.getContext().getObject('ui'))
  photoPickerPromise(globalContext.getContext().getObject('ui'))
  documentPickerCallback(globalContext.getContext().getObject('con'))
  documentPickerPromise(globalContext.getContext().getObject('con'))
  audioPickerCallback(globalContext.getContext().getObject('con'))
  audioPickerPromise(globalContext.getContext().getObject('con'))
  */
}
