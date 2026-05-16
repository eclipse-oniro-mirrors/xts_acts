'use static';
import { Entry, Text, Column, Component, Button, ClickEvent, Color, $r, ColumnOptions, FlexAlign, Direction, Builder, Row, Margin } from '@ohos.arkui.component'
import { State, Watch, PropRef } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { ChipGroup, IconGroupSuffix, IconItemOptions, ChipGroupItemOptions, ChipItemStyle, SuffixImageIconOptions } from '@ohos.arkui.advanced.ChipGroup';
import { ChipSize , ChipSymbolGlyphOptions} from '@ohos.arkui.advanced.Chip';

@Entry
@Component
struct ChipGroupOptionsPage {
  @State selected_index: Array<int> = [0, 1, 2, 3, 4, 5, 6];

  build() {
    Column() {
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('app.media.startIcon') },
            label: { text: 'string' },
            accessibilityDescription: 'accessibilityDescription_str',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: 'undefined' },
            accessibilityDescription: undefined,
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: '空字符串' },
            accessibilityDescription: '',
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock') },
            label: { text: 'auto' },
            accessibilityLevel: 'auto',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'yes' },
            accessibilityLevel: 'yes',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'no' },
            accessibilityLevel: 'no',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: '空字符串' },
            accessibilityLevel: '',
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'no-hide-descendants' },
            accessibilityLevel: 'no-hide-descendants',
          } as ChipGroupItemOptions,
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_stream') },
            label: { text: 'undefined' },
            accessibilityLevel: undefined,
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'string-20vp' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: '20vp', endSpace: 0 },
        chipGroupPadding: { top: '20vp', bottom: '20vp' },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'double-20' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: 20, endSpace: 0 },
        chipGroupPadding: { top: 20, bottom: 20 },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })

      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: 'undefined' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: undefined, endSpace: 0 },
        chipGroupPadding: undefined,
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })

      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('sys.media.ohos_ic_public_cast_mirror') },
            label: { text: '空字符串' },
          } as ChipGroupItemOptions,
        ],
        itemStyle: {
          size: ChipSize.SMALL,
          backgroundColor: $r('sys.color.ohos_id_color_button_normal'),
          fontColor: $r('sys.color.ohos_id_color_text_primary'),
          selectedBackgroundColor: $r('sys.color.ohos_id_color_emphasize'),
          selectedFontColor: $r('sys.color.ohos_id_color_text_primary_contrary'),
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 8, startSpace: '', endSpace: 0 },
        chipGroupPadding: { top: '', bottom: '' },
        onChange: (activatedChipsIndex: Array<int>) => {
          console.info('chips on clicked, activated index ' + activatedChipsIndex);
        },
      })
    }.width('100%').margin({ top: 30 } as Margin)
  }
}