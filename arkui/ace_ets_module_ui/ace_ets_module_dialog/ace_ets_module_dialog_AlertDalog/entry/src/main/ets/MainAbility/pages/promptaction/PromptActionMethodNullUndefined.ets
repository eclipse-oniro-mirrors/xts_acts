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
 	 
 	 import { promptAction,UIContext,PromptAction, LevelMode, ImmersiveMode  } from '@kit.ArkUI';
 	 
 	 @Entry
 	 @Component
 	 struct PromptActionMethodNullUndefinedExample {
 	   uiContext: UIContext = this.getUIContext();
 	   promptAction1: PromptAction = this.uiContext.getPromptAction();
 	   build() {
 	     Scroll(){
 	       Column() {
 	         // ShowToast
 	         Row(){
 	           Button('Show toast1')
 	             .onClick(() => {
 	               promptAction.showToast({
 	                 message: 'Toast1',
 	                 bottom:'',
 	                 enableHoverMode:true
 	               });
 	               AppStorage.setOrCreate('promptActionShowToast1',true)
 	             }).width('25%').id('promptActionShowToast1')
 	           Button('Show toast2')
 	             .onClick(() => {
 	               promptAction.showToast({
 	                 message: 'Toast2',
 	                 bottom:'',
 	                 enableHoverMode:false
 	               });
 	               AppStorage.setOrCreate('promptActionShowToast2',true)
 	             }).width('25%').id('promptActionShowToast2')
 	           Button('Show toast3')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showToast(null);
 	               }catch {
 	                 AppStorage.setOrCreate('promptActionShowToast3',true)
 	               }
 	             }).width('25%').id('promptActionShowToast3')
 	           Button('Show toast4')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showToast(undefined);
 	               }catch {
 	                 AppStorage.setOrCreate('promptActionShowToast4',true)
 	               }
 	             }).width('25%').id('promptActionShowToast4')
 	         }
 	         // openToast
 	         Row(){
 	           Button('Open toast1')
 	             .onClick(() => {
 	               this.promptAction1.openToast({
 	                 message: 'Toast1',
 	                 bottom:'',
 	                 enableHoverMode:true,
 	                 showMode:promptAction.ToastShowMode.DEFAULT
 	               });
 	               AppStorage.setOrCreate('promptActionOpenToast1',true)
 	             }).width('25%').id('promptActionOpenToast1')
 	           Button('Open toast2')
 	             .onClick(() => {
 	               this.promptAction1.openToast({
 	                 message: 'Toast2',
 	                 bottom:'',
 	                 enableHoverMode:false,
 	                 showMode:promptAction.ToastShowMode.TOP_MOST
 	               });
 	               AppStorage.setOrCreate('promptActionOpenToast2',true)
 	             }).width('25%').id('promptActionOpenToast2')
 	           Button('Open toast3')
 	             .onClick(() => {
 	               try {
 	                 promptAction.openToast(null);
 	               }catch {
 	                 AppStorage.setOrCreate('promptActionOpenToast3',true)
 	               }
 	             }).width('25%').id('promptActionOpenToast3')
 	           Button('Open toast4')
 	             .onClick(() => {
 	               try {
 	                 promptAction.openToast(undefined);
 	               }catch {
 	                 AppStorage.setOrCreate('promptActionOpenToast4',true)
 	               }
 	             }).width('25%').id('promptActionOpenToast4')
 	         }
 	 
 	         // showDialog--1
 	         Row(){
 	           Button('Show Dialog1')
 	             .onClick(() => {
 	               promptAction.showDialog({
 	                 buttons:[],
 	                 isModal:false,
 	                 enableHoverMode:true,
 	                 levelMode:LevelMode.OVERLAY,
 	                 immersiveMode:ImmersiveMode.DEFAULT
 	               },()=>{});
 	               AppStorage.setOrCreate('promptActionShowDialog1',true)
 	             }).width('25%').id('promptActionShowDialog1')
 	           Button('Show Dialog2')
 	             .onClick(() => {
 	               promptAction.showDialog({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 isModal:true,
 	                 enableHoverMode:false,
 	                 levelMode:LevelMode.EMBEDDED,
 	                 immersiveMode:ImmersiveMode.EXTEND
 	               },()=>{});
 	               AppStorage.setOrCreate('promptActionShowDialog2',true)
 	             }).width('25%').id('promptActionShowDialog2')
 	           Button('Show Dialog3')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showDialog(null,()=>{});
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowDialog3',true)
 	               }
 	             }).width('25%').id('promptActionShowDialog3')
 	           Button('Show Dialog4')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showDialog(undefined,()=>{});
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowDialog4',true)
 	               }
 	             }).width('25%').id('promptActionShowDialog4')
 	         }
 	         // showDialog--2
 	         Row(){
 	           Button('Show Dialog5')
 	             .onClick(() => {
 	               promptAction.showDialog({
 	                 buttons:[],
 	                 isModal:false,
 	                 enableHoverMode:true,
 	                 levelMode:LevelMode.OVERLAY,
 	                 immersiveMode:ImmersiveMode.DEFAULT,
 	                 showInSubWindow:false
 	               });
 	               AppStorage.setOrCreate('promptActionShowDialog5',true)
 	             }).width('25%').id('promptActionShowDialog5')
 	           Button('Show Dialog6')
 	             .onClick(() => {
 	               promptAction.showDialog({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 isModal:true,
 	                 enableHoverMode:false,
 	                 levelMode:LevelMode.EMBEDDED,
 	                 immersiveMode:ImmersiveMode.EXTEND,
 	                 showInSubWindow:true
 	               });
 	               AppStorage.setOrCreate('promptActionShowDialog6',true)
 	             }).width('25%').id('promptActionShowDialog6')
 	           Button('Show Dialog7')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showDialog(null);
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowDialog7',true)
 	               }
 	             }).width('25%').id('promptActionShowDialog7')
 	           Button('Show Dialog8')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showDialog(undefined);
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowDialog8',true)
 	               }
 	             }).width('25%').id('promptActionShowDialog8')
 	         }
 	         // showActionMenu--1
 	         Row(){
 	           Button('Show ActionMenu1')
 	             .onClick(() => {
 	               promptAction.showActionMenu({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 showInSubWindow:false,
 	                 isModal:false,
 	                 levelMode:LevelMode.OVERLAY,
 	                 immersiveMode:ImmersiveMode.DEFAULT
 	               },()=>{});
 	               AppStorage.setOrCreate('promptActionShowActionMenu1',true)
 	             }).width('25%').id('promptActionShowActionMenu1')
 	           Button('Show ActionMenu2')
 	             .onClick(() => {
 	               promptAction.showActionMenu({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 isModal:true,
 	                 showInSubWindow:true,
 	                 levelMode:LevelMode.EMBEDDED,
 	                 immersiveMode:ImmersiveMode.EXTEND
 	               },()=>{});
 	               AppStorage.setOrCreate('promptActionShowActionMenu2',true)
 	             }).width('25%').id('promptActionShowActionMenu2')
 	           Button('Show ActionMenu3')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showActionMenu(null,()=>{});
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowActionMenu3',true)
 	               }
 	             }).width('25%').id('promptActionShowActionMenu3')
 	           Button('Show ActionMenu4')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showActionMenu(undefined,()=>{});
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowActionMenu4',true)
 	               }
 	             }).width('25%').id('promptActionShowActionMenu4')
 	         }
 	         // showActionMenu--2
 	         Row(){
 	           Button('Show ActionMenu5')
 	             .onClick(() => {
 	               promptAction.showActionMenu({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 showInSubWindow:false,
 	                 isModal:false,
 	                 levelMode:LevelMode.OVERLAY,
 	                 immersiveMode:ImmersiveMode.DEFAULT
 	               });
 	               AppStorage.setOrCreate('promptActionShowActionMenu5',true)
 	             }).width('25%').id('promptActionShowActionMenu5')
 	           Button('Show ActionMenu6')
 	             .onClick(() => {
 	               promptAction.showActionMenu({
 	                 buttons:[{primary:true,text:'1',color:'#fff000'},{primary:false,text:'2',color:'#00ff00'}],
 	                 isModal:true,
 	                 showInSubWindow:true,
 	                 levelMode:LevelMode.EMBEDDED,
 	                 immersiveMode:ImmersiveMode.EXTEND
 	               });
 	               AppStorage.setOrCreate('promptActionShowActionMenu6',true)
 	             }).width('25%').id('promptActionShowActionMenu6')
 	           Button('Show ActionMenu7')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showActionMenu(null);
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowActionMenu7',true)
 	               }
 	             }).width('25%').id('promptActionShowActionMenu7')
 	           Button('Show ActionMenu8')
 	             .onClick(() => {
 	               try {
 	                 promptAction.showActionMenu(undefined);
 	               } catch {
 	                 AppStorage.setOrCreate('promptActionShowActionMenu8',true)
 	               }
 	             }).width('25%').id('promptActionShowActionMenu8')
 	         }
 	       }.height('100%').width('100%').justifyContent(FlexAlign.Center)
 	     }
 	   }
 	 }