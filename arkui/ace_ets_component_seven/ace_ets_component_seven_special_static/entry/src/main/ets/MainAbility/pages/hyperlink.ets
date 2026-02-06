'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, AttributeModifier, HyperlinkAttribute, Hyperlink, ResourceColor } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TestHyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mColor: string = '#FF789456'

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance
			.color(this.mColor)
	}
}

@Entry
@Component
struct TestHyperlinkPage {
	@State modifier: TestHyperlinkModifier = new TestHyperlinkModifier()

	build() {
		Column() {
			Hyperlink('https://example.com/')
				.key('HyperlinkKey1')
				.attributeModifier(this.modifier)
		}
			.width('100%')
			.height('100%')
	}
}
