/**
 	  * Copyright (c) 2025 Huawei Device Co., Ltd.
 	  * Licensed under the Apache License, Version 2.0 (the 'License');
 	  * you may not use this file except in compliance with the License.
 	  * You may obtain a copy of the License at
 	  *
 	  *     http://www.apache.org/licenses/LICENSE-2.0
 	  *
 	  * Unless required by applicable law or agreed to in writing, software
 	  * distributed under the License is distributed on an 'AS IS' BASIS,
 	  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 	  * See the License for the specific language governing permissions and
 	  * limitations under the License.
 	  */
 	 
 	 import { LevelOrder, PromptAction, UIContext } from '@kit.ArkUI';
 	 
 	 @Entry
 	 @Component
 	 struct LevelOrderClampNullUndefined {
 	   @State toastId: number = 0;
 	   uiContext: UIContext = this.getUIContext();
 	   promptAction: PromptAction = this.uiContext.getPromptAction();
 	 
 	   build() {
 	     Column() {
		 	Button('close').id('closeToast')
 	       Button('OpenToast1')
 	         .height(100)
 	         .type(ButtonType.Capsule)
 	         .onClick(() => {
 	           this.promptAction.showDialog({
 	             message: 'ToastMessage1',
 	             levelOrder:LevelOrder.clamp(null)
 	           })
 	           AppStorage.setOrCreate('setLevelOrderNull',true)
 	         }).id('OpenToastLevelOrderNull')
 	       Button('OpenToast2')
 	         .height(100)
 	         .type(ButtonType.Capsule)
 	         .onClick(() => {
 	           this.promptAction.showDialog({
 	             message: 'ToastMessage2',
 	             levelOrder:LevelOrder.clamp(undefined)
 	           })
 	           AppStorage.setOrCreate('setLevelOrderUndefined',true)
 	         }).id('OpenToastLevelOrderUndefined')
 	     }.height('100%').width('100%').justifyContent(FlexAlign.Center)
 	   }
 	 }