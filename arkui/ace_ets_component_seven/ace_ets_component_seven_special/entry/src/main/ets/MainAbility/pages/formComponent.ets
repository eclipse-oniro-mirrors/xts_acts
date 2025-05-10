/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

class FormComponentModifier implements AttributeModifier<FormComponentAttribute>{
	applyNormalAttribute(instance: FormComponentAttribute): void {
		instance.size({ width: 200, height: 300 });
		instance.allowUpdate(false);
		instance.dimension(FormDimension.Dimension_2_1);
		instance.visibility(Visibility.Visible);
		instance.moduleName('model1');
	}
}

//FormComponent
@Entry
@Component
  struct FormComponentExample {
	@State buttonMod: FormComponentModifier = new FormComponentModifier()
	@State formId: number = 0;

	build() {
		Column() {
			Text('this is a card')
				.fontSize(50)
				.fontWeight(FontWeight.Bold)
			FormComponent({
				id: this.formId,
				name: "widget",
				bundle: "com.example.myapplication",
				ability: "EntryFormAbility",
				module: "entry",
				dimension: FormDimension.Dimension_2_2,
				temporary: false
			})
			.key('FormComponentKey1')
			.attributeModifier(this.buttonMod)

      FormComponent({
				id: this.formId,
				name: "widget",
				bundle: "com.example.myapplication",
				ability: "EntryFormAbility",
				module: "entry",
				dimension: FormDimension.Dimension_2_2,
				temporary: false
			})
			.key('FormComponentKey2')
			.size({ width: 200, height: 300 })
      .allowUpdate(false)
      .dimension(FormDimension.Dimension_2_1)
      .visibility(Visibility.Visible)
      .moduleName('model2')
		}
	  .width('100%')
		.height('100%')
	}
}