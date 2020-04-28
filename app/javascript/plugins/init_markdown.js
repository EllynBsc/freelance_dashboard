import MarkdownIt from 'markdown-it';

const initMarkdown = () => {
  const textareas = document.querySelectorAll('#editor');
  const preview = document.getElementById('preview');
  const markdown = new MarkdownIt();
  textareas.forEach((textarea) => {
    textarea.addEventListener('keyup', (event) => {
    const ArrayOfValues = Array.from(textareas).map(input => input.value)
    const total =  ArrayOfValues[0] + '\n' +  ArrayOfValues[1]

    const html = markdown.render(total);
    preview.innerHTML = html
  });

 });
};

export { initMarkdown };
