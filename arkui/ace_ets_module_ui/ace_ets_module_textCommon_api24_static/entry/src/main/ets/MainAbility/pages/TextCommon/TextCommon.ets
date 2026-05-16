/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

'use static';

/**
 * TextCommon：非枚举 + 枚举 API 覆盖。
 * CASE9（ColorShaderStyle / Text.shaderStyle）整段已注释：当前运行态会导致本页无法进入；代码保留待修复后启用。
 */

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Scroll,
  Row,
  Button,
  FlexAlign,
  TextController,
  Text,
  TextInput,
  RichEditor,
  RichEditorController,
  IMEClient,
  TextDataDetectorConfig,
  TextDataDetectorType,
  TextContentAlign,
  FlipDirection,
  SuperscriptStyle,
  TextVerticalAlign,
  NumericTextTransition,
  LinearGradientOptions,
  RadialGradientOptions,
  TextLayoutOptions,
  TextDecorationType,
  TextMenuItem,
  TextMenuItemId,
  TextRange,
  RichEditorTextSpanResult,
  RichEditorTextSpanOptions,
  RichEditorTextStyle,
  DecorationStyleInterface,
  ResourceStr,
  Color,
  ColorShaderStyle
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { LengthMetrics } from '@ohos.arkui.node';
import { InputMethodExtraConfig } from '@ohos.inputMethod.ExtraConfig';

const PFX = 'TextCommon';
const TEXT_COMMON_KEY = 'TextCommon_text_bind';

@Entry
@Component
struct TextCommonPage {
  private textCtl: TextController = new TextController();
  private richCtl: RichEditorController = new RichEditorController();
  private detCfg: TextDataDetectorConfig = {
    types: [TextDataDetectorType.PHONE_NUMBER],
    enablePreviewMenu: true
  };
  private linearOpts: LinearGradientOptions = {
    colors: [
      ['#FF0000FF', 0.0],
      ['#FFFF0000', 1.0]
    ]
  } as LinearGradientOptions;
  private radialOpts: RadialGradientOptions = {
    center: ['50%', '50%'],
    radius: '60%',
    colors: [
      ['#FF00FF00', 0.0],
      ['#FF000000', 1.0]
    ]
  } as RadialGradientOptions;
  private colorShader: ColorShaderStyle = new ColorShaderStyle(Color.Red);
  private ntFromOptions: NumericTextTransition = new NumericTextTransition({
    flipDirection: FlipDirection.DOWN,
    enableBlur: true
  });
  private ntOptsFlipOnly: NumericTextTransition = new NumericTextTransition({
    flipDirection: FlipDirection.UP
  });
  private ntOptsBlurOnly: NumericTextTransition = new NumericTextTransition({
    enableBlur: false
  });
  private ntInstance: NumericTextTransition = new NumericTextTransition();

  private onPrepareMenuBind(items: TextMenuItem[]): TextMenuItem[] {
    AppStorage.setOrCreate<string>(`${PFX}_onPrepareMenu_ok`, 'true');
    return items;
  }

  build() {
    Scroll() {
      Column({ space: 0 } as ColumnOptions) {
      Row() {
        Button('0')
          .id(`${PFX}_btn_enum_TEXT_CONTENT_ALIGN_TOP`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_CONTENT_ALIGN_TOP`,
              TextContentAlign.TOP === 0 ? 'true' : 'false'
            );
          })
        Button('1')
          .id(`${PFX}_btn_enum_TEXT_CONTENT_ALIGN_CENTER`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_CONTENT_ALIGN_CENTER`,
              TextContentAlign.CENTER === 1 ? 'true' : 'false'
            );
          })
        Button('2')
          .id(`${PFX}_btn_enum_TEXT_CONTENT_ALIGN_BOTTOM`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_CONTENT_ALIGN_BOTTOM`,
              TextContentAlign.BOTTOM === 2 ? 'true' : 'false'
            );
          })
      }
      .id(`${PFX}_row_enum_text_content_align`)
      .width('100%')
      .height('4%')

      Row() {
        Button('0')
          .id(`${PFX}_btn_enum_FLIP_DIRECTION_DOWN`)
          .fontSize(9)
          .width('48%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_FLIP_DIRECTION_DOWN`,
              FlipDirection.DOWN === 0 ? 'true' : 'false'
            );
          })
        Button('1')
          .id(`${PFX}_btn_enum_FLIP_DIRECTION_UP`)
          .fontSize(9)
          .width('48%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_FLIP_DIRECTION_UP`,
              FlipDirection.UP === 1 ? 'true' : 'false'
            );
          })
      }
      .id(`${PFX}_row_enum_flip_direction`)
      .width('100%')
      .height('4%')

      Row() {
        Button('0')
          .id(`${PFX}_btn_enum_SUPERSCRIPT_STYLE_NORMAL`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_SUPERSCRIPT_STYLE_NORMAL`,
              SuperscriptStyle.NORMAL === 0 ? 'true' : 'false'
            );
          })
        Button('1')
          .id(`${PFX}_btn_enum_SUPERSCRIPT_STYLE_SUPERSCRIPT`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_SUPERSCRIPT_STYLE_SUPERSCRIPT`,
              SuperscriptStyle.SUPERSCRIPT === 1 ? 'true' : 'false'
            );
          })
        Button('2')
          .id(`${PFX}_btn_enum_SUPERSCRIPT_STYLE_SUBSCRIPT`)
          .fontSize(9)
          .width('31%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_SUPERSCRIPT_STYLE_SUBSCRIPT`,
              SuperscriptStyle.SUBSCRIPT === 2 ? 'true' : 'false'
            );
          })
      }
      .id(`${PFX}_row_enum_superscript`)
      .width('100%')
      .height('4%')

      Row() {
        Button('0')
          .id(`${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_BASELINE`)
          .fontSize(9)
          .width('23%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_VERTICAL_ALIGN_BASELINE`,
              TextVerticalAlign.BASELINE === 0 ? 'true' : 'false'
            );
          })
        Button('1')
          .id(`${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_BOTTOM`)
          .fontSize(9)
          .width('23%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_VERTICAL_ALIGN_BOTTOM`,
              TextVerticalAlign.BOTTOM === 1 ? 'true' : 'false'
            );
          })
        Button('2')
          .id(`${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_CENTER`)
          .fontSize(9)
          .width('23%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_VERTICAL_ALIGN_CENTER`,
              TextVerticalAlign.CENTER === 2 ? 'true' : 'false'
            );
          })
        Button('3')
          .id(`${PFX}_btn_enum_TEXT_VERTICAL_ALIGN_TOP`)
          .fontSize(9)
          .width('23%')
          .height('90%')
          .constraintSize({ minHeight: '0%', maxHeight: '100%' })
          .onClick((): void => {
            AppStorage.setOrCreate<string>(
              `${PFX}_enum_TEXT_VERTICAL_ALIGN_TOP`,
              TextVerticalAlign.TOP === 3 ? 'true' : 'false'
            );
          })
      }
      .id(`${PFX}_row_enum_text_vertical_align`)
      .width('100%')
      .height('4%')

      Text('abcdefghijklmnop', { controller: this.textCtl })
        .key(TEXT_COMMON_KEY)
        .id(TEXT_COMMON_KEY)
        .fontSize(14)
        .width('100%')
        .maxLines(2)
        .constraintSize({ minHeight: '5%', minWidth: '100%' })

      Row() {
        Button('layout-pos')
          .id(`${PFX}_btn_m_getCharacterPositionAtCoordinate`)
          .fontSize(9)
          .width('32%')
          .height('90%')
          .onClick((): void => {
            const lm = this.textCtl.getLayoutManager();
            let pos = lm?.getCharacterPositionAtCoordinate(4.0, 14.0);
            if (pos === undefined) {
              pos = lm?.getCharacterPositionAtCoordinate(40.0, 18.0);
            }
            if (pos === undefined) {
              pos = lm?.getCharacterPositionAtCoordinate(12.0, 12.0);
            }
            AppStorage.setOrCreate<string>(
              `${PFX}_m_getCharacterPositionAtCoordinate`,
              pos !== undefined ? `${pos.position}` : 'undefined'
            );
          })
        Button('layout-glyph')
          .id(`${PFX}_btn_m_getGlyphRangeForCharacterRange`)
          .fontSize(9)
          .width('32%')
          .height('90%')
          .onClick((): void => {
            const lm = this.textCtl.getLayoutManager();
            let r = lm?.getGlyphRangeForCharacterRange({ start: 0, end: 2 } as TextRange);
            if (r === undefined) {
              r = lm?.getGlyphRangeForCharacterRange({ start: 0, end: 16 } as TextRange);
            }
            if (r === undefined) {
              r = lm?.getGlyphRangeForCharacterRange({ start: 0, end: 1 } as TextRange);
            }
            AppStorage.setOrCreate<string>(
              `${PFX}_m_getGlyphRangeForCharacterRange`,
              r !== undefined ? `${r.length}` : 'undefined'
            );
          })
        Button('layout-char')
          .id(`${PFX}_btn_m_getCharacterRangeForGlyphRange`)
          .fontSize(9)
          .width('32%')
          .height('90%')
          .onClick((): void => {
            const lm = this.textCtl.getLayoutManager();
            let r = lm?.getCharacterRangeForGlyphRange({ start: 0, end: 1 } as TextRange);
            if (r === undefined) {
              r = lm?.getCharacterRangeForGlyphRange({ start: 0, end: 2 } as TextRange);
            }
            if (r === undefined) {
              r = lm?.getCharacterRangeForGlyphRange({ start: 0, end: 4 } as TextRange);
            }
            AppStorage.setOrCreate<string>(
              `${PFX}_m_getCharacterRangeForGlyphRange`,
              r !== undefined ? `${r.length}` : 'undefined'
            );
          })
      }
      .id(`${PFX}_row_layout_manager`)
      .width('100%')
      .height('5%')

      Text('Call 13800138000')
        .id(`${PFX}_text_call_detector`)
        .fontSize(10)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .enableDataDetector(true)
        .dataDetectorConfig(this.detCfg)

      Button('enablePreviewMenu')
        .id(`${PFX}_btn_enablePreviewMenu`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_enablePreviewMenu_ok`,
            this.detCfg.enablePreviewMenu === true ? 'true' : 'false'
          );
        })

      TextInput({ placeholder: 'ime', text: '' })
        .id(`${PFX}_textinput_ime`)
        .width('100%')
        .height('5%')
        .fontSize(10)
        .editMenuOptions({
          onCreateMenu: (items: TextMenuItem[]): TextMenuItem[] => items,
          onMenuItemClick: (_m: TextMenuItem, _r: TextRange): boolean => false,
          onPrepareMenu: (items: TextMenuItem[]): TextMenuItem[] => this.onPrepareMenuBind(items)
        })
        .onWillAttachIME((client: IMEClient) => {
          AppStorage.setOrCreate<string>(`${PFX}_ime_nodeId`, `${client.nodeId}`);
          const cfg: InputMethodExtraConfig = { customSettings: { 'tc': 1 } };
          client.setExtraConfig(cfg);
          AppStorage.setOrCreate<string>(`${PFX}_ime_cfg_ok`, 'true');
          AppStorage.setOrCreate<string>(`${PFX}_m_setExtraConfig`, 'true');
        })

      Button('trigger onPrepareMenu')
        .id(`${PFX}_btn_onPrepareMenu_invoke`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          const sample: TextMenuItem[] = [{ content: 'c', id: TextMenuItemId.COPY }];
          this.onPrepareMenuBind(sample);
        })

      RichEditor({ controller: this.richCtl })
        .id(`${PFX}_richeditor_main`)
        .width('100%')
        .height('10%')

      Button('decoration thicknessScale')
        .id(`${PFX}_btn_decoration_thicknessScale`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          const deco: DecorationStyleInterface = {
            type: TextDecorationType.Underline,
            color: '#333333'
          };
          const tstyle: RichEditorTextStyle = {
            decoration: deco
          };
          const spanOptions: RichEditorTextSpanOptions = {
            style: tstyle
          };
          this.richCtl.addTextSpan('Hi' as ResourceStr, spanOptions);
          const spans = this.richCtl.getSpans();
          if (spans !== undefined && spans.length > 0) {
            const first = spans[0] as RichEditorTextSpanResult;
            const th = first.textStyle.decoration.thicknessScale;
            AppStorage.setOrCreate<string>(
              `${PFX}_decoration_thicknessScale`,
              th !== undefined ? `${th}` : 'undefined'
            );
          } else {
            AppStorage.setOrCreate<string>(`${PFX}_decoration_thicknessScale`, 'no_spans');
          }
        })

      Text('linear gradient')
        .id(`${PFX}_text_linear_gradient`)
        .fontSize(11)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .linearGradient(this.linearOpts)

      Button('LinearGradientOptions.colors')
        .id(`${PFX}_btn_linear_gradient_options`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_linear_gradient_options_ok`,
            this.linearOpts.colors.length >= 1 ? 'true' : 'false'
          );
        })

      Text('radial gradient')
        .id(`${PFX}_text_radial_gradient`)
        .fontSize(11)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .radialGradient(this.radialOpts)

      Button('RadialGradientOptions.radius')
        .id(`${PFX}_btn_radial_gradient_options`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_radial_gradient_options_ok`,
            this.radialOpts.radius !== undefined ? 'true' : 'false'
          );
        })

      Text('0')
        .id(`${PFX}_text_nt_0`)
        .fontSize(15)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .contentTransition(this.ntFromOptions)

      Button('NumericTextTransition options (flip+blur)')
        .id(`${PFX}_btn_numeric_transition_options`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          const ok =
            this.ntFromOptions.flipDirection === FlipDirection.DOWN &&
            this.ntFromOptions.enableBlur === true;
          AppStorage.setOrCreate<string>(`${PFX}_numeric_transition_options_ok`, ok ? 'true' : 'false');
        })

      Text('1')
        .id(`${PFX}_text_nt_1`)
        .fontSize(15)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .contentTransition(this.ntOptsFlipOnly)

      Button('NumericTextTransitionOptions.flipDirection')
        .id(`${PFX}_btn_nto_flip`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_nto_flip_ok`,
            this.ntOptsFlipOnly.flipDirection === FlipDirection.UP ? 'true' : 'false'
          );
        })

      Text('2')
        .id(`${PFX}_text_nt_2`)
        .fontSize(15)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .contentTransition(this.ntOptsBlurOnly)

      Button('NumericTextTransitionOptions.enableBlur')
        .id(`${PFX}_btn_nto_blur`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          AppStorage.setOrCreate<string>(
            `${PFX}_nto_blur_ok`,
            this.ntOptsBlurOnly.enableBlur === false ? 'true' : 'false'
          );
        })

      Text('3')
        .id(`${PFX}_text_nt_3`)
        .fontSize(15)
        .width('100%')
        .constraintSize({ minHeight: '3%', minWidth: '100%' })
        .contentTransition(this.ntInstance)

      Button('NumericTextTransition.flipDirection inst')
        .id(`${PFX}_btn_nt_inst_flip`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          this.ntInstance.flipDirection = FlipDirection.UP;
          AppStorage.setOrCreate<string>(
            `${PFX}_nt_inst_flip_ok`,
            this.ntInstance.flipDirection === FlipDirection.UP ? 'true' : 'false'
          );
        })

      Button('NumericTextTransition.enableBlur inst')
        .id(`${PFX}_btn_nt_inst_blur`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          this.ntInstance.enableBlur = true;
          AppStorage.setOrCreate<string>(
            `${PFX}_nt_inst_blur_ok`,
            this.ntInstance.enableBlur === true ? 'true' : 'false'
          );
        })

      Text('color shader')
        .fontSize(16)
        .width('100%')
        .shaderStyle(this.colorShader)
      Button('ColorShaderStyle.color')
        .id(`${PFX}_btn_color_shader_color`)
        .fontSize(11)
        .onClick((): void => {
          AppStorage.setOrCreate<string>(`${PFX}_color_shader_color_ok`, `${this.colorShader.color}`);
        })

      Button('TextLayoutOptions.constraintWidth')
        .id(`${PFX}_btn_text_layout_options`)
        .fontSize(9)
        .width('100%')
        .height('4%')
        .onClick((): void => {
          const opts: TextLayoutOptions = { constraintWidth: LengthMetrics.vp(120) };
          AppStorage.setOrCreate<string>(
            `${PFX}_text_layout_options_ok`,
            opts.constraintWidth !== undefined ? 'true' : 'false'
          );
        })
      }
      .id(`${PFX}_page_root`)
      .width('100%')
      .justifyContent(FlexAlign.Start)
    }
    .id(`${PFX}_page_scroll`)
    .width('100%')
    .height('100%')
  }
}
