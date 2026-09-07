import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_INFO,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_MEDIUM,
  SWIFT_UI_TEXT_PRIMARY,
  SWIFT_UI_TEXT_SECONDARY,
  swiftUIColorWithOpacity,
  SwiftUITone
} from 'theme'
import { SwiftUIPanel } from 'panel'
import { SwiftUIIconBadge } from 'icon-badge'

@Component
export struct SwiftUIEmptyStateCard {
  @Prop title: ResourceStr = ''
  @Prop message: ResourceStr = ''
  @Prop icon: ResourceStr = ''
  @Prop actionText: ResourceStr = ''
  @Prop actionColor: ResourceColor = getSwiftUIPalette().primary
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 'auto'
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop iconColor: ResourceColor = SWIFT_UI_INFO
  @Prop iconSize: Length = 32
  @Prop actionHeight: Length = 42
  @Prop titleFontSize: number = 17
  @Prop messageFontSize: number = 15
  onAction: () => void = () => {
  }
  @BuilderParam actionBuilder?: () => void

  @Builder
  PanelContentBuilder() {
    Row({ space: SWIFT_UI_SPACING_MEDIUM }) {
      SwiftUIIconBadge({
        icon: this.icon,
        color: this.iconColor,
        tone: this.tone,
        componentWidth: this.iconSize,
        componentHeight: this.iconSize,
        fillColor: this.fillColor,
        tintColor: this.tintColor,
        customBorderColor: this.customBorderColor,
        cornerRadius: this.cornerRadius
      })

      Text(this.title)
        .fontSize(this.titleFontSize)
        .fontWeight(FontWeight.Bold)
        .fontColor(SWIFT_UI_TEXT_PRIMARY)
        .layoutWeight(1)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)

    Text(this.message)
      .fontSize(this.messageFontSize)
      .fontColor(SWIFT_UI_TEXT_SECONDARY)
      .width('100%')
      .maxLines(4)
      .textOverflow({ overflow: TextOverflow.Ellipsis })

    if (this.actionText !== '' || this.actionBuilder) {
      Button() {
        if (this.actionBuilder) {
          this.actionBuilder()
        } else {
          Text(this.actionText)
            .fontSize(15)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.White)
        }
      }
      .height(this.actionHeight)
      .width('100%')
      .linearGradient({
        direction: GradientDirection.RightBottom,
        colors: [
          [swiftUIColorWithOpacity(this.actionColor, 0.90), 0.0],
          [swiftUIColorWithOpacity(this.actionColor, 0.78), 0.58],
          [swiftUIColorWithOpacity(getSwiftUIGlassMaterial(this.tone).highlight, 0.34), 1.0]
        ]
      })
      .backgroundBlurStyle(BlurStyle.Regular)
      .borderRadius(this.cornerRadius)
      .border({ width: 1, color: swiftUIColorWithOpacity(getSwiftUIGlassMaterial(this.tone).highlight, 0.42) })
      .shadow({ radius: 14, color: swiftUIColorWithOpacity(this.actionColor, 0.16), offsetX: 0, offsetY: 6 })
      .onClick(() => {
        this.onAction()
      })
    }
  }

  build() {
    SwiftUIPanel({
      spacing: SWIFT_UI_SPACING_MEDIUM,
      tone: this.tone,
      componentWidth: this.componentWidth,
      componentHeight: this.componentHeight,
      fillColor: this.fillColor,
      tintColor: this.tintColor,
      customBorderColor: this.customBorderColor,
      cornerRadius: this.cornerRadius,
      contentBuilder: () => {
        this.PanelContentBuilder()
      }
    })
  }
}
