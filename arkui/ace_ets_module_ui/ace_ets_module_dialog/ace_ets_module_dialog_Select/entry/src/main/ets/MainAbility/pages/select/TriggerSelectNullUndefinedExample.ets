/**
 	  * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 	 
 	 
 	 class MyMenuItemContentModifier1 implements ContentModifier<MenuItemConfiguration> {
 	   modifierText: string = '';
 	   constructor(text: string) {
 	     this.modifierText = text;
 	   }
 	   applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
 	     return wrapBuilder(MenuItemBuilder1);
 	   }
 	 }
 	 
 	 @Builder
 	 function MenuItemBuilder1(configuration: MenuItemConfiguration) {
 	   Row() {
 	     Text((configuration.contentModifier as MyMenuItemContentModifier1).modifierText)
 	   }
 	   .onClick(() => {
 	     configuration.triggerSelect(null,null);
 	     console.log('triggerSelect+triggerSelectNull')
 	     AppStorage.setOrCreate('triggerSelectNull',true)
 	   })
 	 }
 	 
 	 class MyMenuItemContentModifier2 implements ContentModifier<MenuItemConfiguration> {
 	   modifierText: string = '';
 	   constructor(text: string) {
 	     this.modifierText = text;
 	   }
 	   applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
 	     return wrapBuilder(MenuItemBuilder2);
 	   }
 	 }
 	 
 	 @Builder
 	 function MenuItemBuilder2(configuration: MenuItemConfiguration) {
 	   Row() {
 	     Text((configuration.contentModifier as MyMenuItemContentModifier2).modifierText)
 	   }
 	   .onClick(() => {
 	     configuration.triggerSelect(undefined,undefined);
 	     console.log('triggerSelect+triggerSelectUndefined')
 	     AppStorage.setOrCreate('triggerSelectUndefined',true)
 	   })
 	 }
 	 
 	 class MyMenuItemContentModifier3 implements ContentModifier<MenuItemConfiguration> {
 	   modifierText: string = '';
 	   constructor(text: string) {
 	     this.modifierText = text;
 	   }
 	   applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
 	     return wrapBuilder(MenuItemBuilder3);
 	   }
 	 }
 	 
 	 @Builder
 	 function MenuItemBuilder3(configuration: MenuItemConfiguration) {
 	   Row() {
 	     Text((configuration.contentModifier as MyMenuItemContentModifier3).modifierText)
 	   }
 	   .onClick(() => {
 	     configuration.triggerSelect(2,'');
 	     console.log('triggerSelect+triggerSelectEmpty')
 	     AppStorage.setOrCreate('triggerSelectEmpty',true)
 	   })
 	 }
 	 
 	 @Entry
 	 @Component
 	 struct TriggerSelectNullUndefinedExample {
 	   build() {
 	     Column() {
 	       Row() {
 	         Select([
 	           { value: 'item' },
 	         ])
 	           .value('triggerSelectNull_select')
 	           .menuItemContentModifier(new MyMenuItemContentModifier1('triggerSelectNull'))
 	           .id('triggerSelectNull')
 	       }.height('10%').margin(10)
 	       Row() {
 	         Select([
 	           { value: 'item' },
 	         ])
 	           .value('triggerSelectUndefined_select')
 	           .menuItemContentModifier(new MyMenuItemContentModifier2('triggerSelectUndefined'))
 	           .id('triggerSelectUndefined')
 	       }.height('10%').margin(10)
 	       Row() {
 	         Select([
 	           { value: 'item' },
 	         ])
 	           .value('triggerSelectEmpty_select')
 	           .menuItemContentModifier(new MyMenuItemContentModifier3('triggerSelectEmpty'))
 	           .id('triggerSelectEmpty')
 	       }.height('10%').margin(10)
 	     }
 	   }
 	 }