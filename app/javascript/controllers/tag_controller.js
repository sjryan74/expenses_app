import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tagdiv", "taginput", "transid" ]

  remove() {
    this.tagdivTarget.remove()
  }

  add() {
    let tagName = this.taginputTarget.value
    let transactionId = Number(this.transidTarget.value)

    if (tagName != null && tagName != '' && Number.isInteger(transactionId)) {
      console.log(`Adding tag ${tagName}`)

      fetch(`/transactions/${transactionId}/tags`, {
        method: 'post',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify({ tag_name: tagName })
      }).then(response => response.json())
      .then(data => {
        this.renderTag(data)
      })
      this.taginputTarget.value = ''
    }
  }

  createSearchAnchor(tagName) {
    const anchor = document.createElement('a')
    anchor.setAttribute('href', `/transactions/search?search=tag%3A%22${tagName}%22`)
    anchor.innerHTML = tagName
    return anchor
  }

  createRemoveAnchor(transId, tagId) {
    const anchor = document.createElement('a')
    anchor.setAttribute('class', 'remove')
    anchor.setAttribute('title', 'Remove tag')
    anchor.setAttribute('data-action', 'click-&gt;tag#remove')
    anchor.setAttribute('data-remote', true)
    anchor.setAttribute('rel', 'nofollow')
    anchor.setAttribute('data-method', 'delete')
    anchor.setAttribute('href', `/transactions/${transId}/tags/remove/${tagId}`)
    anchor.innerHTML = "<span></span>"
    return anchor
  }

  createDivTag(transId, tagId, tagName) {
    const tagDiv = document.createElement('div')
    tagDiv.setAttribute("class", "tag")
    tagDiv.setAttribute("data-controller", "tag")
    tagDiv.setAttribute("data-target", "tag.divtag")
    tagDiv.insertAdjacentElement('afterbegin', this.createSearchAnchor(tagName))
    tagDiv.insertAdjacentElement('afterbegin', this.createRemoveAnchor(transId, tagId))
    return tagDiv
  }

  renderTag(tag) {
    console.log('Rendering ' + tag.id + ' ' + tag.name)
    const transId = this.transidTarget.value
    const tagDiv = this.createDivTag(transId, tag.id, tag.name)
    this.transidTarget.insertAdjacentElement('beforebegin', tagDiv)
  }
}
