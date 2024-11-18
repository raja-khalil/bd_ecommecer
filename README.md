# Banco de Dados para E-commerce

## **Descrição**
Este projeto apresenta a modelagem e criação de um banco de dados relacional para um sistema de e-commerce. O banco foi projetado para gerenciar as principais entidades do negócio, como clientes, produtos, fornecedores, pedidos, pagamentos, entregas e vendedores.

O objetivo deste banco de dados é fornecer suporte a operações de um sistema de vendas online, incluindo o registro de clientes, gerenciamento de estoque, processamento de pedidos, controle de pagamentos e status de entregas.

---

## **Estrutura do Banco de Dados**

### **Tabelas Criadas**
1. **Cliente**
   - Armazena informações dos clientes, permitindo CPF ou CNPJ.
   - Exemplo de campos: `Nome`, `CPF`, `CNPJ`, `Email`, `Telefone`, `Endereço`.

2. **Fornecedor**
   - Registra informações de fornecedores.
   - Exemplo de campos: `Nome_Fornecedor`, `Email`, `Telefone`, `Endereço`.

3. **Produto**
   - Contém detalhes dos produtos cadastrados.
   - Exemplo de campos: `Nome_Produto`, `Preço`, `Descrição`, `Quantidade_Estoque`.

4. **Pedido**
   - Representa os pedidos realizados pelos clientes.
   - Exemplo de campos: `Data_Pedido`, `Total_Pedido`.

5. **Item_Pedido**
   - Relaciona pedidos aos produtos incluídos.
   - Exemplo de campos: `Pedido_ID_Pedido`, `Produto_ID_Produto`, `Quantidade`, `Subtotal`.

6. **Pagamento**
   - Registra informações sobre os pagamentos realizados.
   - Exemplo de campos: `Tipo_Pagamento`, `Valor_Pagamento`.

7. **Entrega**
   - Gerencia o status das entregas e códigos de rastreamento.
   - Exemplo de campos: `Status_Entrega`, `Codigo_Rastreamento`.

8. **Vendedor**
   - Contém informações sobre os vendedores cadastrados.
   - Exemplo de campos: `Nome_Vendedor`, `Email`, `Telefone`.

---

## **Relacionamentos**
- **Cliente ↔ Pedido**: Um cliente pode realizar múltiplos pedidos (1:N).
- **Pedido ↔ Item_Pedido**: Um pedido pode conter múltiplos produtos (1:N).
- **Produto ↔ Fornecedor**: Um produto é fornecido por um único fornecedor (N:1).
- **Pedido ↔ Pagamento**: Um pedido pode ter vários pagamentos (1:N).
- **Pedido ↔ Entrega**: Cada pedido possui uma única entrega (1:1).

---

## **Como Utilizar**
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/ecommerce-database.git
