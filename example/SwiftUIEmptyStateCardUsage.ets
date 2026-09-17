import { SwiftUIEmptyStateCard } from 'empty-state-card'

@Component
export struct SwiftUIEmptyStateCardUsage {
  build() {
    SwiftUIEmptyStateCard({
      title: 'No records yet',
      message: 'Create the first record to start tracking this section.',
      icon: 'i',
      actionText: 'Create record',
      actionColor: '#235595',
      onAction: () => {
      }
    })
  }
}
