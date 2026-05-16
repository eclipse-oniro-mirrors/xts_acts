/**
 	  * Copyright (C) 2026 Huawei Device Co., Ltd.
 	  * Licensed under the Apache License, Version 2.0 (the 'License')
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
 	 
 	 import { Popup, PopupTextOptions, PopupButtonOptions, PopupIconOptions } from '@kit.ArkUI';
 	 
 	 @Entry
 	 @Component
 	 struct AdvancedPopupExample {
 	   build() {
 	     Scroll(){
 	       Column() {
 	         // popup 自定义高级组件
 	         Popup({
 	           // PopupIconOptions类型设置图标内容
 	           icon: {
 	             // $r('app.media.icon')需要替换为开发者所需的图像资源文件。
 	             image: $r('app.media.icon'),
 	             width: 32,
 	             height: 32,
 	             fillColor: Color.White,
 	             borderRadius: 16
 	           } as PopupIconOptions,
 	           // PopupTextOptions类型设置文字内容
 	           title: {
 	             text: 'This is a popup with PopupOptions',
 	             fontSize: '',
 	             fontColor: Color.Black,
 	             fontWeight: ''
 	           } as PopupTextOptions,
 	           // PopupTextOptions类型设置文字内容
 	           message: {
 	             text: 'message1',
 	             fontSize: '',
 	             fontColor: Color.Black,
 	             fontWeight:''
 	           } as PopupTextOptions,
 	           showClose: false,
 	           onClose: () => {
 	             console.info('close Button click');
 	           },
 	           // PopupButtonOptions类型设置按钮内容
 	           buttons: [{
 	             text: 'confirm',
 	             action: () => {
 	               console.info('confirm button click');
 	             },
 	             fontSize: 15,
 	             fontColor: Color.Black,
 	           },
 	             {
 	               text: 'cancel',
 	               action: () => {
 	                 console.info('cancel button click');
 	               },
 	               fontSize: 15,
 	               fontColor: Color.Black
 	             },] as [PopupButtonOptions?, PopupButtonOptions?]
 	         })
 	         Popup({
 	           // PopupIconOptions类型设置图标内容
 	           icon:undefined,
 	           // PopupTextOptions类型设置文字内容
 	           title: undefined,
 	           // PopupTextOptions类型设置文字内容
 	           message: {
 	             text: 'message2',
 	             fontSize: 15,
 	             fontColor: Color.Black
 	           } as PopupTextOptions,
 	           showClose: false,
 	           onClose: () => {
 	             console.info('close Button click');
 	           },
 	           // PopupButtonOptions类型设置按钮内容
 	           buttons: [{
 	             text: 'confirm',
 	             action: () => {
 	               console.info('confirm button click');
 	             },
 	             fontSize: 15,
 	             fontColor: Color.Black,
 	           },
 	             {
 	               text: 'cancel',
 	               action: () => {
 	                 console.info('cancel button click');
 	               },
 	               fontSize: 15,
 	               fontColor: Color.Black
 	             },] as [PopupButtonOptions?, PopupButtonOptions?]
 	         })
 	       }
 	     }
 	   }
 	 }